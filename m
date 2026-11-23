Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2B0606A31A
	for <kvm-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 15:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JhRlS0t8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e9Uq4Xe1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=91fkAUeJJ1/MO2xCR6jI7FrUvLp20iwXs3g5mw7q25w=; b=JhRlS0t84H+JuwAr3eqPrDtM8K
	SydXZaMBsotRT3V4r63IjicgpHpG4k3iJjtfMpUu8zLFxKFn/hIm3zeKd8734Pxmh/6bImxjD5ZRj
	jPiG2IvUZsxROOSWzBhgeZbB7EiWwn3RIfuvogqjR9d8mUwywnTJhK5VROk9kuZXGPKRiqIpngGs4
	5RcwBmtAJGIzSXi4UFh8as0PuwJIgMTp4MEcM2UY2SFya2rcCb2cxumT9XTyH6b95plMj6anbFB5a
	UinGm4kH4eVt/JZ65QQYEMXijOfAbzry7BZHnUcb8l8v9KRzZexWM0u4gBFzvKlpvkkcWivCFnwhq
	UuBPYNpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVwm-00000003ytR-2BG2;
	Mon, 23 Nov 2026 15:27:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVwl-00000003ysu-0i8k
	for kvm-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 15:27:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 546BA622DC;
	Mon, 23 Nov 2026 15:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F14A1F000CA;
	Mon, 23 Nov 2026 15:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795447629;
	bh=9TZM6XuQCVdejYnoblYTNL9KeRxvPg2JJEEUf+a0CiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e9Uq4Xe1qpaATaiDo5wOIGfM+EwwcSQCdX2R2WULHbjBs1ZKYHp5YWudfo93wnIy5
	 /EhRUZq0GSxcIuK9YxYvHnRR5XYYZ4V2QQ7T4acP62KJQSB0P4u2p+GsiWTqdMR5Fi
	 z+ih5lmoVRpbnEDzOThc0xJ4cyzHo+8go0bQAqSuS2gcJiuVz/EZRvD5IQWJa8vj0J
	 Dvg9kXq7oPJFI6klRrQcc37C/KER5hExgJomgHTE/a0s4Zfgc9yNZhTDqX/6URCxR3
	 ti4Ppj9+UFttR1Ut9xW8NOhqoUUxbYhCt7YJZHZFqIEDcO9rh1rdwELZoH2asAErZr
	 KGA11e44z4i3Q==
Date: Mon, 23 Nov 2026 15:27:01 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Wei-Lin Chang <weilin.chang@arm.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, kvm-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, 
	Fuad Tabba <tabba@google.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/3] KVM: Stop KVM_PRE_FAULT_MEMORY when the vCPU's
 dirty ring is full
Message-ID: <awRaeD7ut2Y5Lv8n@gremlin>
References: <20261123113435.1170711-1-fuad.tabba@linux.dev>
 <20261123113435.1170711-2-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261123113435.1170711-2-fuad.tabba@linux.dev>
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 11:34:33AM +0000, Fuad Tabba wrote:
> Pre-faulting can map a dirty-logged page writable, which pushes it to
> the vCPU's dirty ring. KVM_RUN exits with KVM_EXIT_DIRTY_RING_FULL
> before the ring overflows, but the pre-fault loop never checks it, so
> one call can push more entries than the ring has free, which trips the
> WARN in kvm_dirty_ring_push() and overwrites entries userspace hasn't
> harvested. On x86:
>
>   WARNING: arch/x86/kvm/../../../virt/kvm/dirty_ring.c:225 at kvm_dirty_ring_push+0x7a/0xd0
>   Call Trace:
>    make_spte+0x2cc/0x450
>    kvm_tdp_mmu_map+0x5e1/0x7f0
>    kvm_tdp_page_fault+0x12c/0x1b0
>    kvm_mmu_do_page_fault+0x181/0x250
>    kvm_arch_vcpu_pre_fault_memory+0x136/0x1d0
>    kvm_vcpu_pre_fault_memory+0xcf/0x180
>    kvm_vcpu_ioctl+0x455/0x770
>
> Stop the loop once the ring is soft full, with the check KVM_RUN makes
> before entering the guest. Return the pages already processed, or
> -ENOSPC when there aren't any, since a retry can't succeed until
> userspace harvests and resets the ring. s390 has the ioctl but no ring,
> so give kvm_dirty_ring_check_request() a stub.
>
> The check also sets run->exit_reason to KVM_EXIT_DIRTY_RING_FULL. On
> arm64, KVM_RUN completes a pending MMIO exit only if exit_reason is
> still KVM_EXIT_MMIO, and on riscv KVM_RUN does the same for its MMIO,
> SBI and CSR exits. If a pre-fault stops on a full ring while such an
> exit is pending, the next KVM_RUN doesn't complete it and the guest
> repeats the instruction that caused the exit. Userspace can avoid that
> by completing the exit with KVM_RUN before pre-faulting.

Thanks for adding!

>
> Fixes: bc1a5cd002116 ("KVM: Add KVM_PRE_FAULT_MEMORY vcpu ioctl to pre-populate guest memory")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Thanks! LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  Documentation/virt/kvm/api.rst | 9 +++++++--
>  include/linux/kvm_dirty_ring.h | 5 +++++
>  virt/kvm/kvm_main.c            | 5 +++++
>  3 files changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index e95c9cda085d9..89eb6be9bc6e3 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6544,6 +6544,7 @@ Errors:
>    ENOENT     The specified `gpa` is outside defined memslots.
>    ENOEXEC    The vCPU has not been initialised (arm64).
>    EINTR      An unmasked signal is pending and no page was processed.
> +  ENOSPC     The vCPU's dirty ring is full and no page was processed.
>    EFAULT     The parameter address was invalid.
>    EHWPOISON  A poisoned host page was encountered.
>    EOPNOTSUPP Mapping memory for a GPA is unsupported by the
> @@ -6588,7 +6589,9 @@ case, the ioctl can be called in parallel.
>
>  When the ioctl returns, the input values are updated to point to the
>  remaining range.  If `size` > 0 on return, the caller can just issue
> -the ioctl again with the same `struct kvm_map_memory` argument.
> +the ioctl again with the same `struct kvm_pre_fault_memory` argument.
> +If that fails with ENOSPC, the vCPU's dirty ring has to be harvested
> +and reset first.
>
>  On x86, shadow page tables cannot support this ioctl because they
>  are indexed by virtual address or nested guest physical address.
> @@ -8957,7 +8960,9 @@ Therefore, the ioctl must be called *before* reading the content of
>  the dirty pages.
>
>  The dirty ring can get full.  When it happens, the KVM_RUN of the
> -vcpu will return with exit reason KVM_EXIT_DIRTY_RING_FULL.
> +vcpu will return with exit reason KVM_EXIT_DIRTY_RING_FULL, and
> +KVM_PRE_FAULT_MEMORY on the vcpu will process no more pages until the
> +ring has been harvested and reset.
>
>  The dirty ring interface has a major difference comparing to the
>  KVM_GET_DIRTY_LOG interface in that, when reading the dirty ring from
> diff --git a/include/linux/kvm_dirty_ring.h b/include/linux/kvm_dirty_ring.h
> index eb10d87adf7d5..729615ae0cf4d 100644
> --- a/include/linux/kvm_dirty_ring.h
> +++ b/include/linux/kvm_dirty_ring.h
> @@ -60,6 +60,11 @@ static inline void kvm_dirty_ring_push(struct kvm_vcpu *vcpu,
>  {
>  }
>
> +static inline bool kvm_dirty_ring_check_request(struct kvm_vcpu *vcpu)
> +{
> +	return false;
> +}
> +
>  static inline struct page *kvm_dirty_ring_get_page(struct kvm_dirty_ring *ring,
>  						   u32 offset)
>  {
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index cf4cb586f1407..ac8b94a386e4a 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -4461,6 +4461,11 @@ static int kvm_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
>  			break;
>  		}
>
> +		if (kvm_dirty_ring_check_request(vcpu)) {
> +			r = -ENOSPC;
> +			break;
> +		}
> +
>  		r = kvm_arch_vcpu_pre_fault_memory(vcpu, range);
>  		if (WARN_ON_ONCE(r == 0 || r == -EIO))
>  			break;
> --
> 2.47.3
>
>

--
Cheers, Lorenzo

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
