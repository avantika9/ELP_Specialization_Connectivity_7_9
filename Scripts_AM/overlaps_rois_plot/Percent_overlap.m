% code written to calculate the percentage overlap between two ROIs
% generated out of ROIoverlaps.m

%Calculate percentage overlap of voxels between ses7 and ses9
addpath(genpath('/panfs/accrepfs.vampire/data/booth_lab/LabTools/nifti'));
datapath = '/panfs/accrepfs.vampire/data/booth_lab/AM/ELP/Conn_PhonSem_AM_7_9/preprocessed/AM_ROIs/ROIs';

% Define ROI1
roi_name= 'ses7_pMTG_combined_individual_ROIs.nii';
roi_dir = [datapath '/' 'ses7_sem_specialization' '/' roi_name];
s1 = load_nii(roi_dir);
% Count the number of voxels with value 1 or greater
num_voxels_with_1 = sum(s1.img(:) >= 1);

%Define ROI2
roi_name= 'ses9_pMTG_combined_individual_ROIs.nii';
roi_dir = [datapath '/' 'ses9_sem_specialization' '/' roi_name];
s2 = load_nii(roi_dir);
% Count the number of voxels with value 1 or greater
num_voxels_with_2 = sum(s2.img(:) >= 1);
%%
% Find the voxels with value >= 1 in each ROI file, that is more than 1
% participant overlap in these voxels
voxels_file1 = s1.img >= 1;
voxels_file2 = s2.img >= 1;

% Calculate the overlap between the voxels
overlap = sum(voxels_file1(:) .* voxels_file2(:));

% Calculate the total number of voxels with value >= 1 in each file
total_file1 = sum(voxels_file1(:));
total_file2 = sum(voxels_file2(:));

% Calculate the percentage overlap
percentage_overlap = (overlap / min(total_file1, total_file2)) * 100;

% Display the result
disp(['The percentage overlap in voxels with value >= 1 is: ', num2str(percentage_overlap), '%']);
