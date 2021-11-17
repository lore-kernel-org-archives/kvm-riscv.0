From: David Woodhouse <dwmw2@infradead.org>
Date: Wed, 17 Nov 2021 21:09:35 -0000
Subject: [PATCH v3 08/12] KVM: Propagate vcpu explicitly to
 mark_page_dirty_in_slot()
In-Reply-To: <20211117174003.297096-9-dwmw2@infradead.org>
References: <20211117174003.297096-1-dwmw2@infradead.org>
 <20211117174003.297096-9-dwmw2@infradead.org>
Message-ID: <85d9fec17f32c3eb9e100e56b91af050.squirrel@twosheds.infradead.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> From: David Woodhouse <dwmw@amazon.co.uk>
>
> The kvm_dirty_ring_get() function uses kvm_get_running_vcpu() to work out
> which dirty ring to use, but there are some use cases where that doesn't
> work.
>
> There's one in setting the Xen shared info page, introduced in commit
> 629b5348841a ("KVM: x86/xen: update wallclock region") and reported by
> "butt3rflyh4ck" <butterflyhuangxx@gmail.com> in
> https://lore.kernel.org/kvm/CAFcO6XOmoS7EacN_n6v4Txk7xL7iqRa2gABg3F7E3Naf5uG94g at mail.gmail.com/
>
> There's also about to be another one when the newly-reintroduced
> gfn_to_pfn_cache needs to mark a page as dirty from the MMU notifier
> which invalidates the mapping. In that case, we will *know* the vcpu
> that can be 'blamed' for dirtying the page, and we just need to be
> able to pass it in as an explicit argument when doing so.
>
> This patch preemptively resolves the second issue, and paves the way
> for resolving the first. A complete fix for the first issue will need
> us to switch the Xen shinfo to be owned by a particular vCPU, which
> will happen in a separate patch.
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>



> --- a/virt/kvm/dirty_ring.c
> +++ b/virt/kvm/dirty_ring.c
> @@ -36,12 +36,16 @@ static bool kvm_dirty_ring_full(struct kvm_dirty_ring
> *ring)
>  	return kvm_dirty_ring_used(ring) >= ring->size;
>  }
>
> -struct kvm_dirty_ring *kvm_dirty_ring_get(struct kvm *kvm)
> +struct kvm_dirty_ring *kvm_dirty_ring_get(struct kvm *kvm, struct
> kvm_vcpu *vcpu)
>  {
> -	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
> +	struct kvm_vcpu *running_vcpu = kvm_get_running_vcpu();
>
> +	WARN_ON_ONCE(vcpu && vcpu != running_vcpu);
>  	WARN_ON_ONCE(vcpu->kvm != kvm);

Ah, that one needs to be changed to check running_vcpu instead. Or this
needs to go first:

I think I prefer making the vCPU a required argument. If anyone's going to
pull a vCPU pointer out of their posterior, let the caller do it.

> +	if (!vcpu)
> +		vcpu = running_vcpu;
> +
>  	return &vcpu->dirty_ring;
>  }
>

-- 
dwmw2


