From: Ben Gardon <bgardon@google.com>
Date: Mon, 12 Dec 2022 11:16:21 -0800
Subject: [RFC PATCH 17/37] KVM: Move struct kvm_gfn_range to kvm_types.h
In-Reply-To: <20221208193857.4090582-18-dmatlack@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com> <20221208193857.4090582-18-dmatlack@google.com>
Message-ID: <CANgfPd_JKw+Vtzk30GE1R3_zphOD19w4XYZ6uXQsU0AmZrXo9Q@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 8, 2022 at 11:39 AM David Matlack <dmatlack@google.com> wrote:
>
> Move struct kvm_gfn_range to kvm_types.h so that it's definition can be
> accessed in a future commit by arch/x86/include/asm/kvm/tdp_pgtable.h
> without needing to include the mega-header kvm_host.h.
>
> No functional change intended.
>
> Signed-off-by: David Matlack <dmatlack@google.com>

Reviewed-by: Ben Gardon <bgardon@google.com>

> ---
>  include/linux/kvm_host.h  | 7 -------
>  include/linux/kvm_types.h | 8 ++++++++
>  2 files changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 22ecb7ce4d31..469ff4202a0d 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -256,13 +256,6 @@ int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
>  #endif
>
>  #ifdef KVM_ARCH_WANT_MMU_NOTIFIER

I don't have any problem with always having this defined, but might be
worth noting that it's now defined on all archs, regardless of
KVM_ARCH_WANT_MMU_NOTIFIER.

> -struct kvm_gfn_range {
> -       struct kvm_memory_slot *slot;
> -       gfn_t start;
> -       gfn_t end;
> -       pte_t pte;
> -       bool may_block;
> -};
>  bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
>  bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
>  bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
> diff --git a/include/linux/kvm_types.h b/include/linux/kvm_types.h
> index 59cf958d69df..001aad9ea987 100644
> --- a/include/linux/kvm_types.h
> +++ b/include/linux/kvm_types.h
> @@ -132,4 +132,12 @@ struct kvm_vcpu_stat_generic {
>
>  #define KVM_STATS_NAME_SIZE    48
>
> +struct kvm_gfn_range {
> +       struct kvm_memory_slot *slot;
> +       gfn_t start;
> +       gfn_t end;
> +       pte_t pte;
> +       bool may_block;
> +};
> +
>  #endif /* __KVM_TYPES_H__ */
> --
> 2.39.0.rc1.256.g54fd8350bd-goog
>

