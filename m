From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 18 Mar 2024 18:28:20 +0100
Subject: [kvm-unit-tests PATCH v2 00/13] Enable EFI support
In-Reply-To: <20240305170858.395836-15-andrew.jones@linux.dev>
References: <20240305170858.395836-15-andrew.jones@linux.dev>
Message-ID: <20240318-3fd0fb4ca9e43c2fe5e20ccb@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 05, 2024 at 06:08:59PM +0100, Andrew Jones wrote:
> This series starts with some fixes for backtraces for bugs found
> when tracing with riscv EFI builds. The series then brings EFI
> support to riscv, basing the approach heavily on arm64's support
> (including arm64's improvements[1]). It should now be possible
> to launch tests from EFI-capable bootloaders.
> 
> [1] https://lore.kernel.org/all/20240305164623.379149-20-andrew.jones at linux.dev/
> 
> v2:
>  - Rebase on v3 of arm's efi improvement series
>  - Just make base_address a weak function rather than duplicate it
>  - Always preserve .so files (they're useful for debug)
>  - Build the sieve test for EFI
>  - Pick up a couple tags
> 
> Thanks,
> drew
> 
> Andrew Jones (13):
>   riscv: Call abort instead of assert on unhandled exceptions
>   riscv: show_regs: Prepare for EFI images
>   treewide: lib/stack: Fix backtrace
>   treewide: lib/stack: Make base_address arch specific
>   riscv: Import gnu-efi files
>   riscv: Tweak the gnu-efi imported code
>   riscv: Enable building for EFI
>   riscv: efi: Switch stack in _start
>   efi: Add support for obtaining the boot hartid
>   riscv: Refactor setup code
>   riscv: Enable EFI boot
>   riscv: efi: Add run script
>   riscv: efi: Use efi-direct by default
>

Merged.

Thanks,
drew

