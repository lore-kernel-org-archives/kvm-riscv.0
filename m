From: Alexandre Ghiti <alex@ghiti.fr>
Date: Fri, 24 May 2024 11:18:20 +0200
Subject: [PATCH v3 0/4] Add Svadu Extension Support
In-Reply-To: <20231102120129.11261-1-yongxuan.wang@sifive.com>
References: <20231102120129.11261-1-yongxuan.wang@sifive.com>
Message-ID: <b96e25d7-c8ec-44bd-baf9-c5166389f10e@ghiti.fr>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Yong-Xuan,

On 02/11/2023 13:01, Yong-Xuan Wang wrote:
> Svadu is a RISC-V extension for hardware updating of PTE A/D bits. This
> patch set adds support to enable Svadu extension for both host and guest
> OS.
>
> ---
> v3:
> - fix the control bit name to ADUE in PATCH1 and PATCH3
> - update get-reg-list in PATCH4
>
> v2:
> - add Co-developed-by: in PATCH1
> - use riscv_has_extension_unlikely() to runtime patch the branch in PATCH1
> - update dt-binding
>
> Yong-Xuan Wang (4):
>    RISC-V: Detect and Enable Svadu Extension Support
>    dt-bindings: riscv: Add Svadu Entry
>    RISC-V: KVM: Add Svadu Extension Support for Guest/VM
>    KVM: riscv: selftests: Add Svadu Extension to get-reg-list testt
>
>   .../devicetree/bindings/riscv/extensions.yaml  |  6 ++++++
>   arch/riscv/include/asm/csr.h                   |  1 +
>   arch/riscv/include/asm/hwcap.h                 |  1 +
>   arch/riscv/include/asm/pgtable.h               |  6 ++++++
>   arch/riscv/include/uapi/asm/kvm.h              |  1 +
>   arch/riscv/kernel/cpufeature.c                 |  1 +
>   arch/riscv/kvm/vcpu.c                          |  3 +++
>   arch/riscv/kvm/vcpu_onereg.c                   |  1 +
>   .../testing/selftests/kvm/riscv/get-reg-list.c | 18 ++++++++++++++++++
>   9 files changed, 38 insertions(+)
>

Will you spin a new version for this?

Thanks,

Alex


