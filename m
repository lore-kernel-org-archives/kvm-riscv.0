Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06ED4C61DC4
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 21:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+d312FowAyaSeHgsNVq7Yint7VszYaFpT5pRwLAQP7w=; b=3IaOkqNC1pOi/m
	CCS5k+q+xpW6AanTx0xB5y6JMoW7g1J9qZIUUXLfErFCigLsy0c2kUSodwDnsLPzdhrDIoiTlo32s
	OoXqR4csDNdGB+35WhHFhsZZ2KQ/WcuXVTSX/kJdr+ciPMu8ogs82+jZmu2X6SaN1U3vfJ9dyJHg5
	Dgx0uS+TSPePPqOHaLxVa2BeVuz53ibMsk1zyr8vbD7TPvRVNpw4btjWDy4YsSUZZ/C+k8Y6ePDFA
	yn+MBHxR8vvgWUeB7dHzs6jxKJydNMoxwqvBtLm4YZ77xa6W17t7uyEciSbJDw3/l1SIAJgwFK+86
	LnZhqxEky6igPOFj5HyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzhOa-00000004nDr-20hH;
	Thu, 27 Aug 2026 21:12:24 +0000
Received: from buffalo.birch.relay.mailchannels.net ([23.83.209.24])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzhOX-00000004nDO-1nTm;
	Thu, 27 Aug 2026 21:12:22 +0000
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 63154641C90;
	Thu, 27 Aug 2026 21:12:18 +0000 (UTC)
Received: from pdx1-sub0-mail-a256.dreamhost.com (trex-green-6.trex.outbound.svc.cluster.local [100.96.173.63])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 03F0664185C;
	Thu, 27 Aug 2026 21:12:18 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MC-Copy: exfiltrated-credentials
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Troubled-Celery: 28a404ec2d584dbe_1787865138234_1754118027
X-MC-Loop-Signature: 1787865138234:2965334719
X-MC-Ingress-Time: 1787865138234
Received: from pdx1-sub0-mail-a256.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.173.63 (trex/8.0.2);
	Thu, 27 Aug 2026 21:12:18 +0000
Received: from offworld.lan (unknown [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a256.dreamhost.com (Postfix) with ESMTPSA id 4hWDjs2lZGz1049;
	Thu, 27 Aug 2026 14:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1787865137;
	bh=g3Bm4+9H5vp62O1EVPa150nZzSH2jKkHqCPDQBN1+5s=;
	h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
	b=mHdogV6TWPR/Ab+fq2zyWAkIrb+Aly1nP1rSlfoDJFp+LzjRpman4jrqe03IORaOc
	 RAtAKMc3jR3mgUlaP5Zv3rxrc/kxfC2Zvpnl1xKH9t/46GMHsrsnqA5NwKNQ6ttsam
	 k+LtCrJBs1blzbQrrBqeP1505XIVxom/g9iPw/5pC1P+M8/bnPsKR3AhzDfXNEOa9L
	 NTvxXkxWbZMDyhF0V+vy1koEX8E2JyeFv1lXkgVgVgyTxZeh6fpWv6qpgXLoNcdDpd
	 H6yjQ/BbWzqWQ5jHbvwB282TqenmwdKZ4g5AjbpgyiefzEdEZuGBwMkJ+UwDGhEmjg
	 ROdUOPn0un4SA==
From: Davidlohr Bueso <dave@stgolabs.net>
To: anup@brainfault.org,
	atish.patra@linux.dev
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	Davidlohr Bueso <dave@stgolabs.net>
Subject: [PATCH] riscv/kvm: Only context-switch senvcfg where it exists
Date: Thu, 27 Aug 2026 14:12:09 -0700
Message-Id: <20260827211209.2871124-1-dave@stgolabs.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_141221_595550_7E6B2239 
X-CRM114-Status: UNSURE (   6.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

senvcfg arrived in privileged spec 1.12, but H-capable cores on a
1.11 base exist, ie: sifive P500 (ESWIN EIC7700X) implements the
hypervisor extension yet has no senvcfg. KVM swaps the CSR
unconditionally on every vCPU entry, panicing the host upon a guest
executing its first instruction:

  Oops - illegal instruction [#1]
  Modules linked in: kvm
  CPU: 2 UID: 0 PID: 127 Comm: qemu-system-ris Not tainted 7.2.0-kvm73bug+ #4 PREEMPTLAZY
  Hardware name: Unknown Unknown Product/Unknown Product, BIOS 2024.01 01/01/2024
  epc : kvm_riscv_vcpu_enter_exit+0x26/0xcf8 [kvm]
   ra : kvm_arch_vcpu_ioctl_run+0x4ce/0x5a6 [kvm]
  status: 0000000200000100 badaddr: 0000000010a797f3 cause: 0000000000000002
  [<ffffffff01df432e>] kvm_riscv_vcpu_enter_exit+0x26/0xcf8 [kvm]
  [<ffffffff01deb3b0>] kvm_arch_vcpu_ioctl_run+0x4ce/0x5a6 [kvm]
  [<ffffffff01dd7914>] kvm_vcpu_ioctl+0x180/0x5e4 [kvm]
  [<ffffffff8025702e>] __riscv_sys_ioctl+0x84/0x9a
  [<ffffffff80dfdc72>] do_trap_ecall_u+0x1d8/0x38a
  [<ffffffff80e08644>] handle_exception+0x168/0x174
  Code: 84aa 892e b703 8887 1773 1067 3023 16e5 b783 8907 (97f3) 10a7

Touch the CSR only when RISCV_ISA_EXT_XLINUXENVCFG is set, similar
to __switch_to_envcfg() as well as other swaps conditional on
their extentions.

Fixes: db3c01c7a308 ("RISCV: KVM: Add senvcfg context save/restore")
Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
---
 arch/riscv/kvm/vcpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index e062ca19f9d8..0c2d58db13ab 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -773,7 +773,8 @@ static __always_inline void kvm_riscv_vcpu_swap_in_guest_state(struct kvm_vcpu *
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 
 	vcpu->arch.host_scounteren = csr_swap(CSR_SCOUNTEREN, csr->scounteren);
-	vcpu->arch.host_senvcfg = csr_swap(CSR_SENVCFG, csr->senvcfg);
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_XLINUXENVCFG))
+		vcpu->arch.host_senvcfg = csr_swap(CSR_SENVCFG, csr->senvcfg);
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
 		vcpu->arch.host_sstateen0 = csr_swap(CSR_SSTATEEN0, smcsr->sstateen0);
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFISS))
@@ -787,7 +788,8 @@ static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *v
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 
 	csr->scounteren = csr_swap(CSR_SCOUNTEREN, vcpu->arch.host_scounteren);
-	csr->senvcfg = csr_swap(CSR_SENVCFG, vcpu->arch.host_senvcfg);
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_XLINUXENVCFG))
+		csr->senvcfg = csr_swap(CSR_SENVCFG, vcpu->arch.host_senvcfg);
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
 		smcsr->sstateen0 = csr_swap(CSR_SSTATEEN0, vcpu->arch.host_sstateen0);
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFISS))
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
