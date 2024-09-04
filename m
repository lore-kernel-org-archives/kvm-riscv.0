From: Thomas Huth <thuth@redhat.com>
Date: Wed, 4 Sep 2024 12:57:15 +0200
Subject: [kvm-unit-tests PATCH v2 2/4] Makefile: Prepare for clang EFI
 builds
In-Reply-To: <20240904105020.1179006-8-andrew.jones@linux.dev>
References: <20240904105020.1179006-6-andrew.jones@linux.dev>
 <20240904105020.1179006-8-andrew.jones@linux.dev>
Message-ID: <40bc448a-420b-4dad-872c-5b10a756dd8c@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 04/09/2024 12.50, Andrew Jones wrote:
> clang complains about GNU extensions such as variable sized types not
> being at the end of structs unless -Wno-gnu is used. We may
> eventually want -Wno-gnu, but for now let's just handle the warnings
> as they come. Add -Wno-gnu-variable-sized-type-not-at-end to avoid
> the warning issued for the initrd_dev_path struct.
> 
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>   Makefile | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 3d51cb726120..7471f7285b78 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -50,6 +50,8 @@ EFI_CFLAGS += -fshort-wchar
>   # EFI applications use PIC as they are loaded to dynamic addresses, not a fixed
>   # starting address
>   EFI_CFLAGS += -fPIC
> +# Avoid error with the initrd_dev_path struct
> +EFI_CFLAGS += -Wno-gnu-variable-sized-type-not-at-end
>   # Create shared library
>   EFI_LDFLAGS := -Bsymbolic -shared -nostdlib
>   endif

Reviewed-by: Thomas Huth <thuth@redhat.com>


