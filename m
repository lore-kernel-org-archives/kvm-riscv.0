Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9A7CD8CA8
	for <kvm-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 12:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ztg29tH4DMhDvLcAtxoLKL1lTRnmQvdZN8kTQd7vMJ0=; b=SvETqmWZxn4GKl
	Aw8pmk1FT4kimggPgYj4SEdn1P7lS3+vSKY824SiJjrrWt3gS1Zp4Wk/5NaRxs5FDtT2ZqjOWvtF1
	r55SOsx7SZPicWbMBI44IAMxkvrVNZchwzHLJgkiYmVOPjo0l+w79ZpSijZdKTh1NMqtel5pKJkUm
	3iOKK2dsb8r6Aw2zfiVNTE0GuOmUGYyKuYU4NGn+U6//vrFA9yeIE/nC0MCxH9loKG0HJ9xBTZ2Bn
	OYqKErLo2Ow11/KsnYxr2quDZzYD8tcNeiWG7pavMzQKJ5ASR4uWq/pl57wZwaVuIW7mNEojPkTqD
	cKTYOMY6JnrL9X72A4Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvhv-00000005WjO-00x4;
	Tue, 09 Jun 2026 12:37:27 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvhr-00000005Wj2-0PUf
	for kvm-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 12:37:24 +0000
Received: from 8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 05F52222D65;
	Tue,  9 Jun 2026 14:37:20 +0200 (CEST)
Date: Tue, 9 Jun 2026 14:37:18 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, ashish.kalra@amd.com, michael.roth@amd.com, nsaenz@amazon.com, 
	anelkz@amazon.de, James.Bottomley@hansenpartnership.com, 
	Melody Wang <huibo.wang@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, x86@kernel.org, 
	coconut-svsm@lists.linux.dev, joerg.roedel@amd.com
Subject: Re: [PATCH 35/60] kvm: Add VCPU plane-scheduling state and helpers
Message-ID: <aigE2EvJyZlYDz0V@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
 <20260608144252.351443-36-joro@8bytes.org>
 <e7eb0dba-790a-4644-9895-5c9a7420d7fe@redhat.com>
 <aib8n5lO6HKbLC4Y@8bytes.org>
 <CABgObfbUsDeStnZF-7oyR-W-Bvd4qTMoeUwGizgn10UTdKtZ2A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABgObfbUsDeStnZF-7oyR-W-Bvd4qTMoeUwGizgn10UTdKtZ2A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_053723_302762_F497F631 
X-CRM114-Status: GOOD (  18.50  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 08, 2026 at 07:58:43PM +0200, Paolo Bonzini wrote:
> Related to this, let me know if you want me to pick up again the
> common part, especially with Sashiko being hard at work on it.

Yeah, that might be good, let me think a bit about it and discuss in tomorrows
PUCK call.

> The idea of the userspace scheduling was that you're not forced to use
> it - the kernel can always choose to override it if it's using an
> accelerated implementation of planes (and of plane switching). But it
> also leaves some leeway to different accelerated implementations, each
> of which can pick their own algorithm.
> 
> Conceptually I'd rather keep the possibility of userspace scheduling.
> But maybe it doesn't add much.

My preference is to keep plane scheduling at one place (in the kernel) to keep
it simple. But if you see a need for user-mode to interact there as well (only
really works for VSM), then I can add it.

I read a bit more about VSM and it seems their prioritization of VTLs is a bit
more complicated. VTL0 has the least privileges but boots first, then sets up
VTL1. But VTL1 is only higher-privileged once it is locked by VTL0. Another way
to look at it is that VTL0 de-prioritizes itself.

The patches here are built around the assumption that plane0 is the highest
privileged one and is always runnable. Running any lower-privilege plane must
be triggered by the guest. This is clearly not sufficient for VSM, the question
is how to solve that.

The answer depends on how IRQ delivery affects VTL scheduling in VSM. If a
VM has VTL0 (currently running), VTL1, and VTL2 (highest privilege), and an IRQ
becomed pending for VTL1, does Hyper-V schedule VTL1 directly or does it switch
to VTL2 (highest privilege) first to let it schedule VTL1?

When VSM switches to VTL2 first, then planes could just use a marker for the
highest-privilege plane (which can be non-zero). In the other case the solution
is likely to make the direction in which the vcpu->common->vcpus[] array is
traversed configurable.

-Joerg


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
