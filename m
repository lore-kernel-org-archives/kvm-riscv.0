Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DEBC36017
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 12:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FkZ+Cleh5zZHXHJvVuflLp+ZZtPdphn4wZx//k4DUBw=; b=ctjG1CUwTttWaa
	kmyWzIrv5Rc5fcwYHsPCLgOxM5E2mvRi0JZvSeWCor7WuKBYMO+ItwN+Ryk6yRsRFZr3kJNQPxRob
	c4Putwka43hEJ4meECKwELaOsBqsj+7/3ch7+w6aVVPlGOijM+5zzelnGF85QEagM8v3FtKEV6daK
	VMJbGAjeb+NyiL70+Q5arxpb1ePlQX5BJcycdsPrvOBjYJ0MCtkntDqA9XwGkjtRTU2DTTRGidx8H
	fEi67VlQFeYajowbG2OLNNOAZT0GSIy4AGzLOdDMy0hpd3wpLhx3stiCjNg+ChdgMkGydE06NAf3H
	N1Qp176aRHfvJ9mYE0Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3YY-00000005rWL-456P;
	Tue, 25 Mar 2025 12:38:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3FQ-00000005mdp-24XP;
	Tue, 25 Mar 2025 12:19:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B1B4DA4A6E0;
	Tue, 25 Mar 2025 12:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80920C4CEED;
	Tue, 25 Mar 2025 12:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905151;
	bh=PoJfUz6fT96JeSEjLBp9COIPADXcL2k0zITHh5nATsw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=idrJWqFJvuxgW12tmUJ11d1s4uc7k7PpbAbB+aU99OQWXa8XQFwfpZR+CB2M6ows7
	 Bz7BKgIF7aIQFg1EH6+6k9nvQ4/LIXOrz/dv06mqIlwL6pxot5D2kv43LU9xJWOJzn
	 bHh+KnkpPFol8tYdehZj0xxoJoT5gFWoHWFPvMSPjzMlXWP4nj3z6rtUCxGDtyVqFK
	 wOG14MRBpR1bBnJkwf2yaxxZEEY6ZbpvA2VfbgC0LfqqXSOCNlw5XHFEghaI39aEcK
	 y+5moRsvfS2RFZv/6u6rfqAAETpyO09KDMkz7jZWqmtTOZfS1qXlXxnvTZYH3YblLN
	 kreGeQ3duF5RA==
From: guoren@kernel.org
To: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	torvalds@linux-foundation.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	oleg@redhat.com,
	kees@kernel.org,
	tglx@linutronix.de,
	will@kernel.org,
	mark.rutland@arm.com,
	brauner@kernel.org,
	akpm@linux-foundation.org,
	rostedt@goodmis.org,
	edumazet@google.com,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	gaohan@iscas.ac.cn,
	shihua@iscas.ac.cn,
	jiawei@iscas.ac.cn,
	wuwei2016@iscas.ac.cn,
	drew@pdp7.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	ctsai390@andestech.com,
	wefu@redhat.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	josef@toxicpanda.com,
	dsterba@suse.com,
	mingo@redhat.com,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	guoren@kernel.org,
	xiao.w.wang@intel.com,
	qingfang.deng@siflower.com.cn,
	leobras@redhat.com,
	jszhang@kernel.org,
	conor.dooley@microchip.com,
	samuel.holland@sifive.com,
	yongxuan.wang@sifive.com,
	luxu.kernel@bytedance.com,
	david@redhat.com,
	ruanjinjie@huawei.com,
	cuiyunhui@bytedance.com,
	wangkefeng.wang@huawei.com,
	qiaozhe@iscas.ac.cn
Cc: ardb@kernel.org,
	ast@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-crypto@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	maple-tree@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net,
	linux-btrfs@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	linux-nfs@vger.kernel.org,
	linux-sctp@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [RFC PATCH V3 10/43] rv64ilp32_abi: riscv: Update SATP.MODE.ASID width
Date: Tue, 25 Mar 2025 08:15:51 -0400
Message-Id: <20250325121624.523258-11-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_051912_662942_98DDCD8B 
X-CRM114-Status: UNSURE (   9.31  )
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

From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>

The RV32 employs 9-bit asid_bits due to CSR's xlen=32 constraint,
whereas RV64ILP32 ABI, rooted in RV64 ISA, features a 64-bit
satp CSR. Hence, for rv64ilp32 abi, the exact asid mechanism as
in 64-bit architecture is adopted.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 arch/riscv/mm/context.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 4abe3de23225..c3f9926d9337 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -226,14 +226,18 @@ static inline void set_mm(struct mm_struct *prev,
 
 static int __init asids_init(void)
 {
-	unsigned long asid_bits, old;
+	xlen_t asid_bits, old;
 
 	/* Figure-out number of ASID bits in HW */
 	old = csr_read(CSR_SATP);
 	asid_bits = old | (SATP_ASID_MASK << SATP_ASID_SHIFT);
 	csr_write(CSR_SATP, asid_bits);
 	asid_bits = (csr_read(CSR_SATP) >> SATP_ASID_SHIFT)  & SATP_ASID_MASK;
-	asid_bits = fls_long(asid_bits);
+#if __riscv_xlen == 64
+	asid_bits = fls64(asid_bits);
+#else
+	asid_bits = fls(asid_bits);
+#endif
 	csr_write(CSR_SATP, old);
 
 	/*
@@ -265,9 +269,9 @@ static int __init asids_init(void)
 		static_branch_enable(&use_asid_allocator);
 
 		pr_info("ASID allocator using %lu bits (%lu entries)\n",
-			asid_bits, num_asids);
+			(ulong)asid_bits, num_asids);
 	} else {
-		pr_info("ASID allocator disabled (%lu bits)\n", asid_bits);
+		pr_info("ASID allocator disabled (%lu bits)\n", (ulong)asid_bits);
 	}
 
 	return 0;
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
