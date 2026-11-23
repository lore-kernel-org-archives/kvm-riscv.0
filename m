Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AE8606A31F
	for <kvm-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 15:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J7n08E90;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B9x6wQRX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xfqswxh2rva+UxqURsK/HwHvsTRGY0FLRGO+r/nteHs=; b=J7n08E90v2hW15Xki5l3CaPnfX
	pThpQ3NIQ/IKZyS4+LTXCfuZ5JT7V7Y1tFobdf4NAcunIg1KsX7KgRT69DeZhY6yhgxD73nHuEMpa
	s6wxJdbD4yCzquFgejS+l7+dDycZ03zF8VdffNGT8n1Os7NaByYAYKD8IIlb1rvpTCZ6NfaRvH/FS
	VFcTJL/GKvvawdwYgpHp+Or+eORdus2fuSjzya+Y9ljqkdqByNUBQRpamQqd0Jpk2YCiAMw/LACdA
	XEYIS8cR8Xy+Z87L3Aj1cSoHEvoS80y5fqdDzw2VscxfEACDCbp3VWRwhwJwFZIrpfS2mWecEDAvf
	TrOUk7NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVfw-00000003ubi-0MO6;
	Mon, 23 Nov 2026 15:09:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVfv-00000003ubb-1WrQ
	for kvm-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 15:09:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C951962264;
	Mon, 23 Nov 2026 15:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A2F1F000C6;
	Mon, 23 Nov 2026 15:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795446586;
	bh=dnrRfjLKmIHDzHFw2YMyKPd3bYE0BLJV4hjG0NzpuHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B9x6wQRXV+lRd06FkMrkTcZJeaS8e3jKOIyXDTANXZqBMOvrR7KOjDyWtCjEChBDL
	 j5Y71qINNgguMOorYNzL7fKWDS1xnps2HarzILPgiCJxVqW9l/EC7xCStdAaT/eej2
	 RJyu8K2qXQou6Nv7kib6MPEB7zCBTWIZYIEwOLADYEg6x/lWkemMCtYlnUVk+utNKl
	 LWINkzV/1Ome0GRNKk4Mwe/dZFz44LhqCnu7ys9jz8oLXgsulh3anRrU76m0FTriFc
	 32562AhcsRlcrH3xdfq4ALU+mZnwxHQP766Mmn+QFltMAR685VD564pFHboFGfb1qm
	 s/gtz/HsAkX0g==
Date: Mon, 23 Nov 2026 15:09:37 +0000
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
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v3 2/3] KVM: Warn userspace against ioctls while an exit
 is pending
Message-ID: <awRKhCne0gG1gKZN@gremlin>
References: <20261123113435.1170711-1-fuad.tabba@linux.dev>
 <20261123113435.1170711-3-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261123113435.1170711-3-fuad.tabba@linux.dev>
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

On Mon, Nov 23, 2026 at 11:34:34AM +0000, Fuad Tabba wrote:
> KVM_PRE_FAULT_MEMORY sets run->exit_reason to KVM_EXIT_DIRTY_RING_FULL
> when it stops on a full dirty ring. If an MMIO exit is pending at that
> point, the next KVM_RUN on arm64 and riscv doesn't complete it. Rather
> than document that case alone, which could suggest that other ioctls
> are safe, warn against invoking any ioctl other than KVM_RUN before a
> pending exit is completed.
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Very much agree with Sean's take here that we should instil sufficient fear in
users at doing silly things (also in general not only KVM :).

I wonder if we could add some specific examples or broad description of why it's
unwise for better effect, though? Comments below.

In general though:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  Documentation/virt/kvm/api.rst | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 89eb6be9bc6e3..980ef0cdc1c91 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6974,10 +6974,13 @@ to the byte array.
>
>        The pending state of the operation is not preserved in state which is
>        visible to userspace, thus userspace should ensure that the operation is
> -      completed before performing a live migration.  Userspace can re-enter the
> -      guest with an unmasked signal pending or with the immediate_exit field set
> -      to complete pending operations without allowing any further instructions
> -      to be executed.
> +      completed before performing a live migration.  In general, userspace should
> +      exercise extreme caution when invoking ioctls other than KVM_RUN prior to
> +      completing the original operation.

Perhaps worth saying why? E.g. (as I understand it) that for these exits the
operation is only completed on the next KVM_RUN, and that KVM relies on state
left over from the exit (including parts of struct kvm_run such as exit_reason)
to do so, so any ioctl invoked in between might clobber that state?

I see you intentionally avoided documenting the pre-fault case on its own, but
with the above stated I think a concrete example might be example here, like
e.g.:

"For example, if you were to ... that would result in ... which would absolutely
ruin your day because ..."

Kinda thing :)


> +
> +      Userspace can re-enter the guest with an unmasked signal pending or with
> +      the immediate_exit field set to complete pending operations without
> +      allowing any further instructions to be executed.
>
>  ::
>
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
