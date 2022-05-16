From: Lai Jiangshan <jiangshanlai@gmail.com>
Date: Mon, 16 May 2022 14:54:55 +0800
Subject: [PATCH v5 03/21] KVM: x86/mmu: Derive shadow MMU page role from
 parent
In-Reply-To: <20220513202819.829591-4-dmatlack@google.com>
References: <20220513202819.829591-1-dmatlack@google.com>
 <20220513202819.829591-4-dmatlack@google.com>
Message-ID: <CAJhGHyAU_5Esn6i-eeBNKOh4XenOc9_1aiF8N0+CeMF5yyhxew@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, May 14, 2022 at 4:28 AM David Matlack <dmatlack@google.com> wrote:

> -static hpa_t mmu_alloc_root(struct kvm_vcpu *vcpu, gfn_t gfn, gva_t gva,
> +static hpa_t mmu_alloc_root(struct kvm_vcpu *vcpu, gfn_t gfn, int quadrant,
>                             u8 level, bool direct)
>  {
> +       union kvm_mmu_page_role role;
>         struct kvm_mmu_page *sp;
>
> -       sp = kvm_mmu_get_page(vcpu, gfn, gva, level, direct, ACC_ALL);
> +       role = vcpu->arch.mmu->root_role;
> +       role.level = level;
> +       role.direct = direct;
> +       role.access = ACC_ALL;
> +
> +       if (role.has_4_byte_gpte)
> +               role.quadrant = quadrant;
> +
> +       if (level <= vcpu->arch.mmu->cpu_role.base.level)
> +               role.passthrough = 0;
> +



+       role.level = level;
+
+       if (role.has_4_byte_gpte)
+               role.quadrant = quadrant;

Only these lines are needed because of mmu->pae_root, others are
the same as vcpu->arch.mmu->root_role.

The argument @direct is vcpu->arch.mmu->root_role.direct.
vcpu->arch.mmu->root_role.access is always set to be ACC_ALL.

vcpu->arch.mmu->root_role.passthrough is 0 when mmu->pae_root is used.
Or if vcpu->arch.mmu->root_role.passthrough is 1, @level must be 5
and vcpu->arch.mmu->cpu_role.base.level must be 4, the code here
is useless.

