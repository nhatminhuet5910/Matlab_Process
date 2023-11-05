function resetFolder(folderPath)
    % Xóa tất cả các tệp tin và thư mục con trong thư mục
    if exist(folderPath, 'dir')
        rmdir(folderPath, 's');
    end

    % Tạo một thư mục mới với tên trùng với thư mục cũ
    mkdir(folderPath);
end