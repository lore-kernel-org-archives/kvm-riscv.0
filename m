Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F825C79FB7
	for <kvm-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 14:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWNYWqlMGIZrutyLxP9ItguGWNhP4K8Li3LAT6LSfYM=; b=mg+8M9O1QrNlfqnc7l+44zqL9t
	RwzE6KcepYvXRMkI1sKWVuc7kWfq4HArvCh9gQ7djcWVlMigIHf+lDVj0TRCsISEFEPlIk0L2KG4P
	4p7ga4eeASo4qm3BAX/3XUxt+XCLhG0HYzbZJuYnn8adbxmMQ0G3L/amkkV1tczIsJHhIVW7Ibmsa
	2St3myIPve7Jis7P2r29wLjF5eIAlcd/4TLRjPupNHAxr/CYCOcl2zqWTELkX2j+ofh+FEdkhWF9e
	+JcHMSGdtp5Ujo8e8D3zqLamK2SvwyKnZmivpFrWM9qhJBpesel49D7/9mvcPEw7sPvYWtSZ6fh/j
	tNV6/lnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JVL-0000000C1e9-0sEy;
	Wed, 09 Sep 2026 14:42:27 +0000
Received: from fuchsia.ash.relay.mailchannels.net ([23.83.222.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JVI-0000000C1cr-34pw;
	Wed, 09 Sep 2026 14:42:26 +0000
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 120F062DD6;
	Wed, 09 Sep 2026 14:42:22 +0000 (UTC)
Received: from pdx1-sub0-mail-a221.dreamhost.com (100-98-23-243.trex-nlb.outbound.svc.cluster.local [100.98.23.243])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 88DDB6076E;
	Wed, 09 Sep 2026 14:42:21 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MC-Copy: exfiltrated-credentials
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Snatch-Lyrical: 0b04b30310ebea96_1788964941824_3137234964
X-MC-Loop-Signature: 1788964941824:2690914385
X-MC-Ingress-Time: 1788964941824
Received: from pdx1-sub0-mail-a221.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.98.23.243 (trex/8.0.2);
	Wed, 09 Sep 2026 14:42:21 +0000
Received: from offworld (unknown [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a221.dreamhost.com (Postfix) with ESMTPSA id 4hg3Rw6vl6z4B;
	Wed,  9 Sep 2026 07:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1788964941;
	bh=Jr708C+OdKwurqD/3tHEG44yCZ9vqTl5wcV58I/iSjE=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=XBHn1dsfd+8/MBQinAtKtsRidjDN/6oTcDlu2qDAMPGjDEx0k37VlLWYP6iOJZzXs
	 9MjiICmOIraf2mi1x0eoERex4Z4SdHbWSRZyXRnH1z3EEsFA5BrVArnB2gCZ013/dP
	 jrT0Ly68h7IvCCsgDrLre5jD7f3bL0jinqCszot69OwJOY1QyV2NjzF2UOx7gIqpZL
	 Qq8ou5kum5iKDN0cuYSiGt1Dw+BapFr8+GHLTBBAPj7yKTedOOqkNUWPX7Tc/yq58T
	 8JowJKaSZ3J0j6NnbvP6VwD7o/kOLnOOeumlJwuKZje4hxJ2YKlNEw2QAVYFQ6mqLW
	 KMK1X3PHWhrsA==
Date: Wed, 9 Sep 2026 07:42:18 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: anup@brainfault.org, atish.patra@linux.dev
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv/kvm: Only context-switch senvcfg where it exists
Message-ID: <20260909144218.ddzml7u6vjbbzxnf@offworld>
References: <20260827211209.2871124-1-dave@stgolabs.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260827211209.2871124-1-dave@stgolabs.net>
User-Agent: NeoMutt/20220429
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_074224_973824_D5D0AA5C 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

ping?

On Thu, 27 Aug 2026, Davidlohr Bueso wrote:

>senvcfg arrived in privileged spec 1.12, but H-capable cores on a
>1.11 base exist, ie: sifive P500 (ESWIN EIC7700X) implements the
>hypervisor extension yet has no senvcfg. KVM swaps the CSR
>unconditionally on every vCPU entry, panicing the host upon a guest
>executing its first instruction:
>
>  Oops - illegal instruction [#1]
>  Modules linked in: kvm
>  CPU: 2 UID: 0 PID: 127 Comm: qemu-system-ris Not tainted 7.2.0-kvm73bug+ #4 PREEMPTLAZY
>  Hardware name: Unknown Unknown Product/Unknown Product, BIOS 2024.01 01/01/2024
>  epc : kvm_riscv_vcpu_enter_exit+0x26/0xcf8 [kvm]
>   ra : kvm_arch_vcpu_ioctl_run+0x4ce/0x5a6 [kvm]
>  status: 0000000200000100 badaddr: 0000000010a797f3 cause: 0000000000000002
>  [<ffffffff01df432e>] kvm_riscv_vcpu_enter_exit+0x26/0xcf8 [kvm]
>  [<ffffffff01deb3b0>] kvm_arch_vcpu_ioctl_run+0x4ce/0x5a6 [kvm]
>  [<ffffffff01dd7914>] kvm_vcpu_ioctl+0x180/0x5e4 [kvm]
>  [<ffffffff8025702e>] __riscv_sys_ioctl+0x84/0x9a
>  [<ffffffff80dfdc72>] do_trap_ecall_u+0x1d8/0x38a
>  [<ffffffff80e08644>] handle_exception+0x168/0x174
>  Code: 84aa 892e b703 8887 1773 1067 3023 16e5 b783 8907 (97f3) 10a7
>
>Touch the CSR only when RISCV_ISA_EXT_XLINUXENVCFG is set, similar
>to __switch_to_envcfg() as well as other swaps conditional on
>their extentions.
>
>Fixes: db3c01c7a308 ("RISCV: KVM: Add senvcfg context save/restore")
>Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
>---
> arch/riscv/kvm/vcpu.c | 6 ++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)
>
>diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
>index e062ca19f9d8..0c2d58db13ab 100644
>--- a/arch/riscv/kvm/vcpu.c
>+++ b/arch/riscv/kvm/vcpu.c
>@@ -773,7 +773,8 @@ static __always_inline void kvm_riscv_vcpu_swap_in_guest_state(struct kvm_vcpu *
> 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
>
> 	vcpu->arch.host_scounteren = csr_swap(CSR_SCOUNTEREN, csr->scounteren);
>-	vcpu->arch.host_senvcfg = csr_swap(CSR_SENVCFG, csr->senvcfg);
>+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_XLINUXENVCFG))
>+		vcpu->arch.host_senvcfg = csr_swap(CSR_SENVCFG, csr->senvcfg);
> 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
> 		vcpu->arch.host_sstateen0 = csr_swap(CSR_SSTATEEN0, smcsr->sstateen0);
> 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFISS))
>@@ -787,7 +788,8 @@ static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *v
> 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
>
> 	csr->scounteren = csr_swap(CSR_SCOUNTEREN, vcpu->arch.host_scounteren);
>-	csr->senvcfg = csr_swap(CSR_SENVCFG, vcpu->arch.host_senvcfg);
>+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_XLINUXENVCFG))
>+		csr->senvcfg = csr_swap(CSR_SENVCFG, vcpu->arch.host_senvcfg);
> 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
> 		smcsr->sstateen0 = csr_swap(CSR_SSTATEEN0, vcpu->arch.host_sstateen0);
> 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFISS))
>-- 
>2.39.5
>
>
>-- 
>kvm-riscv mailing list
>kvm-riscv@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/kvm-riscv

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
