From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 14 Sep 2023 10:14:05 +0200
Subject: [PATCH v3 4/9] tools: riscv: Add header file csr.h
In-Reply-To: <119c9d06d64b7e4932c5f74a05af1e769cbe7da6.1694421911.git.haibo1.xu@intel.com>
References: <cover.1694421911.git.haibo1.xu@intel.com>
 <119c9d06d64b7e4932c5f74a05af1e769cbe7da6.1694421911.git.haibo1.xu@intel.com>
Message-ID: <20230914-90a562a03985a9a97afd953a@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 14, 2023 at 09:36:58AM +0800, Haibo Xu wrote:
> Borrow the csr definitions and operations from kernel's
> arch/riscv/include/asm/csr.h to tools/ for riscv. Since
> only 64bit was supported for RISC-V KVM selftests, add
> CONFIG_64BIT definition in kvm/Makefile to ensure only
> 64bit registers were available in csr.h.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  tools/arch/riscv/include/asm/csr.h   | 521 +++++++++++++++++++++++++++
>  tools/testing/selftests/kvm/Makefile |   3 +
>  2 files changed, 524 insertions(+)
>  create mode 100644 tools/arch/riscv/include/asm/csr.h
> 
> diff --git a/tools/arch/riscv/include/asm/csr.h b/tools/arch/riscv/include/asm/csr.h
> new file mode 100644
> index 000000000000..4e86c82aacbd
> --- /dev/null
> +++ b/tools/arch/riscv/include/asm/csr.h
...
> diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> index 0102a0297b84..89ecee2fdb73 100644
> --- a/tools/testing/selftests/kvm/Makefile
> +++ b/tools/testing/selftests/kvm/Makefile
> @@ -222,6 +222,9 @@ CFLAGS += -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99 \
>  ifeq ($(ARCH),s390)
>  	CFLAGS += -march=z10
>  endif
> +ifeq ($(ARCH),riscv)
> +	CFLAGS += -DCONFIG_64BIT
> +endif

This should be a separate patch, since the "import csr.h to tools" should
be completely separate from anything else. Also, all architectures that
KVM selftests supports are 64-bit, so, as another completely separate
patch, I think we should just add CONFIG_64BIT to CFLAGS for all builds,
especially since there's a chance some of the includes the other
architectures are using may need it. Of course we'll need sign-off and
testing from the other arch maintainers.

Thanks,
drew

