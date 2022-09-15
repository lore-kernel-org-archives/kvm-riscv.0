From: Conor.Dooley@microchip.com <Conor.Dooley@microchip.com>
Date: Thu, 15 Sep 2022 16:57:55 +0000
Subject: [PATCH v3 0/2] riscv: KVM: Expose Zicbom to the guest
In-Reply-To: <20220909144400.1114485-1-ajones@ventanamicro.com>
References: <20220909144400.1114485-1-ajones@ventanamicro.com>
Message-ID: <5835b765-ee0d-753d-7772-1ce64b9ec32b@microchip.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Andrew,
Since Palmer declined the version of the Zicbom fixes with the relocation
of the block size, does this patch need a respin?
Thanks,
Conor.

On 09/09/2022 15:43, Andrew Jones wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Add support for exposing the Zicbom extension to guests. This has been
> tested over a QEMU including the Zicbom support [1] ([1] was rebased and
> the Zicboz support from it was dropped.) QEMU was further modified to
> ensure the cache block size was provided in the DT. kvmtool was also
> modified [2] to test the new KVM API and provide the guest the cache
> block size in its DT (The kvmtool patches are based on Anup's Svpbmt/Sstc
> series [3]). These KVM patches are based on the riscv_init_cbom_blocksize()
> cleanup patch from Palmer and the move and expose riscv_cbom_block_size
> patch from Anup which was reposted [4]. This series is also available here
> [5].
> 
> [1] https://gitlab.com/jones-drew/qemu/-/commits/riscv/zicbom
> [2] https://github.com/jones-drew/kvmtool/commits/riscv/zicbom
> [3] https://github.com/avpatel/kvmtool/commits/riscv_svpbmt_sstc_v1
> [4] https://lore.kernel.org/linux-riscv/20220906074509.928865-1-ajones at ventanamicro.com/T/#u
> [5] https://github.com/jones-drew/linux/commits/riscv/kvm/zicbom-v3
> 
> Thanks,
> drew
> 
> v3:
>  - Added check to ensure the extension is enabled for
>    config.get(blocksz) [Atish and Anup]
>  - Opportunistically switched all extension checks in
>    kvm_riscv_vcpu_update_config() to riscv_isa_extension_available()
>    from its __ counterpart
>  - Picked up some r-b's
> 
> v2:
>  - Dropped a patch that output the cache block size to dmesg
> 
> Andrew Jones (2):
>   RISC-V: KVM: Provide UAPI for Zicbom block size
>   RISC-V: KVM: Expose Zicbom to the guest
> 
>  arch/riscv/include/uapi/asm/kvm.h |  2 ++
>  arch/riscv/kvm/vcpu.c             | 17 +++++++++++++++--
>  arch/riscv/mm/cacheflush.c        |  1 +
>  3 files changed, 18 insertions(+), 2 deletions(-)
> 
> --
> 2.37.2
> 

