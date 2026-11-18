Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440C3606A320
	for <kvm-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 19:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Yg7Ep7tK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=i6T5OkA6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wk8P2/ll5uM3jJ1SdD/BAJBf5FwqKkFOHO/+z+aLSjg=; b=Yg7Ep7tKtZ8IrDLSsrNrOEfthe
	ZS8VXcS6BMt6CFVX8IyrazPcJr6NJSg3bnJQR9r3CCNGabVLYs15F2xwoQu1zYM9F98qsJ+fotuaK
	xie+AH28DgKw0BiT4tOagpNMIpUSk0VklnND7AjojpRoegx2gNsJJJFX5V4eB06j2Yf/J1X6iTuPp
	4ZFARcgH0q8jOWJ2bgfUU1bayh5N7UIfDaq6CwdpAAJLCAqFZ4YfNphDUga+70jIIg/TvldAo9G7q
	S9HOtE3iqn14/57AAdecqdPscsJOlbhLffHeUmqhKvMyz2ztzIG2wZl5FD4dRzhVO3HQ3K0aJD2Pr
	6RHl5bCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTl2o-0000000A5E6-3fZl;
	Wed, 18 Nov 2026 19:10:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTl2n-0000000A5Dd-2ZxU
	for kvm-riscv@bombadil.infradead.org;
	Wed, 18 Nov 2026 19:10:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YxWsOpaN6CU+fFgVMclUNy68ZrjNu1idGsKCVJ6O9Z4=; b=i6T5OkA6HB7NG25CMcQ8Te4Ltr
	KxIOzXx/mNFMONQ4ViCWFPNmIrUOuZVTIe8TZnkkJlz9SvrT7bF+8x41WWOLI8qO2kRjpz3bGORzX
	iZXB3H/1+181sDQQBjKkDX3Ecxc0BS+EsdKOocrWt+stbQmWHtKIf0QpLepBumkQf/831tPfnEejg
	Mn0K+Y6S4HnvTOy97cfE4cJl/H97wFiYDnoEOJ+PmptkQJL2VFtvIU9o0jXrb7h8DKMAaRLOBo6Ic
	75Zv3gjRNJV25Ap9P2B/c6B1/SSOXgveIKaxkIQi9zRBBjJ2Hb8o/hzhGZMKQfHMsaX3VVDtMH58Q
	ZlneSFqw==;
Received: from [2a00:23ee:2910:16f:a90:4999:d4c:f045] (helo=ehlo.thunderbird.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTl2l-0000000GRW5-1yMX;
	Wed, 18 Nov 2026 19:10:07 +0000
Date: Wed, 18 Nov 2026 19:10:01 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
CC: Sean Christopherson <seanjc@google.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, ashish.kalra@amd.com,
 michael.roth@amd.com, nsaenz@amazon.com, anelkz@amazon.de,
 James.Bottomley@HansenPartnership.com, Melody Wang <huibo.wang@amd.com>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, x86@kernel.org,
 coconut-svsm@lists.linux.dev, joerg.roedel@amd.com,
 Mushahid Hussain <hmushi@amazon.co.uk>,
 Sriram Nambakam <snambakam@linux.microsoft.com>,
 David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH 06/16] KVM: x86: Widen the plane vCPU fd ioctl allowlist
User-Agent: K-9 Mail for Android
In-Reply-To: <4e4fb011-9171-42c1-b499-27b0333a2fd6@redhat.com>
References: <20260608144252.351443-1-joro@8bytes.org> <20261111222911.477-1-dwmw2@infradead.org> <20261111222911.477-7-dwmw2@infradead.org> <4e4fb011-9171-42c1-b499-27b0333a2fd6@redhat.com>
Message-ID: <D0EE54A9-3FF3-4005-875B-A9AF04EB1341@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
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
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18 November 2026 17:58:33 GMT, Paolo Bonzini <pbonzini@redhat.com> wrote:
>On 11/11/26 23:29, David Woodhouse wrote:
>> From: David Woodhouse <dwmw@amazon.co.uk>
>> 
>> A VMM that puts an initial VTL context on a higher plane cannot finish
>> the job through the plane vCPU's fd. kvm_arch_is_vcpu_plane_ioctl()
>> refuses the ioctls it needs, while the one capability ioctl it does
>> admit, KVM_ENABLE_CAP, reaches *every* vCPU capability handler.
>> 
>>   - KVM_GET/SET_MP_STATE: a plane vCPU for an AP starts in
>>     wait-for-INIT like any non-boot x86 vCPU, and nothing ever sends
>>     INIT/SIPI to the higher plane of an AP. The VMM has to mark it
>>     runnable itself.
>>   - KVM_SET_GUEST_DEBUG: single-step and breakpoints on a non-zero
>>     plane. The debug exits surface through the plane-0 KVM_RUN loop
>>     like any other plane exit.
>>   - KVM_X86_SETUP_MCE: mcg_cap is per vCPU and every twin starts with
>>     the KVM_MAX_MCE_BANKS default, so programming plane 0 alone leaves
>>     the planes disagreeing. Hyper-V shares MCG state across VTLs.
>>   - KVM_ENABLE_CAP: accept only the audited capabilities on a plane fd,
>>     the SynIC pair and the two CPUID-enforcement toggles, which change
>>     state that each twin keeps separately. Anything else gets -EINVAL, as
>>     non-allowlisted ioctls already do. The nested paths behind
>>     enlightened VMCS and direct TLB flush have never been audited for
>>     plane_level > 0, and without the filter any future vCPU cap would
>>     work on planes without anyone having decided that it should.
>
>Not sure about KVM_ENABLE_CAP, the other seem sane.
>
>BTW at some point I'll rewrite these commit messages, they're infuriating...

Yeah. I've grown kind of immune to them now. Even found myself typing "load-bearing" with my actual meat fingers the other day.

I've also been looking harder at the completion thing. We *can't* (well, I don't want to) enter another plane while there's still a completion waiting on the first plane.

Which means any control register or MSR interception which needs to be handed to another plane has to completed first.

I think we need to be able to complete them with the RIP unchanged (not advanced over the instruction). Then for VSM, it's VTL1 which will handle them and then advance RIP for its VTL0. VTL1 wants to be told the instruction length too; I could make QEMU find it but since KVM tends to have it anyway, I'm looking at how I can export that.


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
