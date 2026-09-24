Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF6CC9830E
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 14:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0L9zDxmZUZRvEG4TxG5TPBfuosNRVPDId2NqX2Eaf80=; b=dzjVISx3PcMGB7
	L0LqsMOIo7mgOqhSJ9lxtuU7cwqrTeMISv/8OmxvHvCJb69rEx+iQpVTRdH/mOtbIykGQUVI7udht
	xwu0kUqzTswyxOjXsC8v8fG4wgTi8k2LqBzTJduaGxBEDXC6H08AxPwXIBHspS3KNPrLTxCVmNJkt
	9Zso1yQvwmUBM2q0Losh+EIS0hyK6A5p3PSKuoTa33GsPo+SzEbUPxEs/yszP0QpuA+wdqQeePIER
	NGXAZRx9Gnxgp5CC7qPZ/CGkwIDEAHm/1y6jY1pmD0nOIch2aPCxzdx9ov71cLWiQTu9aNJiIs7vj
	F52e/N0wf8cUNA8HV2Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9kA1-0000000BDbi-1fNB;
	Thu, 24 Sep 2026 14:10:53 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9k9y-0000000BDb0-1TDb
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 14:10:51 +0000
Received: from 8bytes.org (p200300f6af404a00e4ccc4fdbbd66590.dip0.t-ipconnect.de [IPv6:2003:f6:af40:4a00:e4cc:c4fd:bbd6:6590])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 561341C7465;
	Thu, 24 Sep 2026 16:10:47 +0200 (CEST)
Date: Thu, 24 Sep 2026 16:10:46 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Tom Lendacky <thomas.lendacky@amd.com>, ashish.kalra@amd.com, 
	michael.roth@amd.com, nsaenz@amazon.com, anelkz@amazon.de, 
	Melody Wang <huibo.wang@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, x86@kernel.org, 
	coconut-svsm@lists.linux.dev, joerg.roedel@amd.com
Subject: Re: [PATCH 35/60] kvm: Add VCPU plane-scheduling state and helpers
Message-ID: <arUtYyK25eKQYY7j@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
 <20260608144252.351443-36-joro@8bytes.org>
 <e7eb0dba-790a-4644-9895-5c9a7420d7fe@redhat.com>
 <aib8n5lO6HKbLC4Y@8bytes.org>
 <CABgObfbUsDeStnZF-7oyR-W-Bvd4qTMoeUwGizgn10UTdKtZ2A@mail.gmail.com>
 <aigE2EvJyZlYDz0V@8bytes.org>
 <570f82e8b8bc968a31a4ba859145f6c324e41247.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <570f82e8b8bc968a31a4ba859145f6c324e41247.camel@HansenPartnership.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_071050_552646_4580D0E9 
X-CRM114-Status: GOOD (  22.52  )
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

Hi James,

On Fri, Jul 17, 2026 at 10:35:10AM -0400, James Bottomley wrote:
> So this all depends how the planes are started.  If you're starting
> them from an IGVM file that loads the most privileged code and then
> runs the guest in a different plane, absolutely, it can work as you
> describe.  However, the common use case for serviceable security
> enclaves is you start the kernel first (necessarily in plane 0) and
> then bring up the enclaves later which means the planes > 0 are
> technically higher privilege since they're running hidden security
> code.  HOWEVER, there's no reason at all to trust a security enclave
> that's doing something like guarding private keys to be able to poke
> anywhere it wants in the guest ... that's a security breach waiting to
> happen, so it would really be better if the model were not
> hierarchical, but more akin to the ability to seal planes off from each
> other, so the kernel can start the enclave, which would then set itself
> and the communication area up, but then the plane 0 kernel would remove
> access to most memory from the enclave.
> 
> In this sealing model, there's no absolute privilege levels; each plane
> would decide what the other planes can see of its memory space and, on
> security grounds, we'd likely configure the enclaves to have the least
> possible privilege.
> 
> Now, Windows applications expect VSM to be strictly hierarchical in
> terms of privilege, but if we create a sealing primitive as described
> above, we can get it to build the strict VSM privilege hierarchy in the
> hyper-v driver.

I mostly agree with this and have to say that my statement in the cover letter
about plane hierarchies was a bit broad.

The main assumption this patch-set makes about plane 0 is that it is the plane
which does the IRQ scheduling. Say a VM has Plane 0,1, and 2. A VCPU runs plane
2 and KVM wants to inject an IRQ into plane 1 of that VCPU. Now KVM needs the
VCPU to decide whether it wants to run plane 1 to handle the IRQ or continue
with plane 2 because it currently has higher-priority work to do.

This decision is made on plane 0 in this patch-set, which it needs to be for
VMPLs. Does VSM have a similar concept for IRQ scheduling between VTLs or will
the hypervisor take care to run a VTL when it has IRQs?


-Joerg

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
