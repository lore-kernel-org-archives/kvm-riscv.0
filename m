Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD60C35FFC
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 12:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2tBvV2XSMhcs1bLuItPQeCA70kRuHQEuThRoNWc7Lq8=; b=iZ9d+/W4MHD+PZ
	BBxVb3uLpSwrWB0yO/JHHwce+I1uPn4mmOYivY+vCFgfJYDeywSF5kVu2m7cfssfBESfTQhrqQP2Y
	VI870jGA9KRvXHhtdwAu582zLtvM7gZtAe9KtsaABjn7/r7+2kAIU1woU9B/nkTN0AZ3YMM6RR9XX
	TtM+zKgeVhsySh27TQVOh7PBqQToh3bU7sl0VELoWGb/eomgxwmdAhb3oArdQer2KVae4e02sCjEB
	PwisVybVkWhRjfAshILBlgY+SO55kCAOe01rpuDhAFat/wczeyG10gd3OjBUxcYxLq4cQ7512tFVQ
	rvO1tWlmHTwMEjiyDAeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3a9-00000005sf9-0rMH;
	Tue, 25 Mar 2025 12:40:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3Gl-00000005mzf-0Pmd;
	Tue, 25 Mar 2025 12:20:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 790A343492;
	Tue, 25 Mar 2025 12:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3FBC4CEEE;
	Tue, 25 Mar 2025 12:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905234;
	bh=IFZFjonaMzbpRZ4swpgyItEna4nE83LkZzb9BRzGITE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YGv7Ju8FJqwJKAhoK+0bpefpHJmqwSqitCJQ3KA8SHoFBO3xjgZJGCnN1+EpM9Ri8
	 G0F8vKvx8n6+OSgZoVo+DMyBKKoIIhJSCP3taMQ5FZeWGN/R31z9hqNogcz/s/Onyr
	 z7gFsqQn85faeI7gGJQLGHu93WAcoXryyyRSyQsANFNuhZaVIo6Dx8943m3kKw9yDg
	 27bjtFahCMk02wsXueW0/FZUhPIbW+fn3gQxchZIXU1nl5TX8/4hg5q3hXCN/9iqSh
	 /WA528nukATyoTdAqfWLTZshpwfuMiYbtl8zLXtJpFV+4Wd+cfr5szXSWpIHHAHUjx
	 4Ts1fcwAE9wQQ==
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
Subject: [RFC PATCH V3 16/43] rv64ilp32_abi: riscv: Support physical addresses >= 0x80000000
Date: Tue, 25 Mar 2025 08:15:57 -0400
Message-Id: <20250325121624.523258-17-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_052035_177947_BEC3E9DC 
X-CRM114-Status: UNSURE (   7.46  )
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

The RV64ILP32 ABI has two independent 2GiB address space:
 - 0 ~ 0x7fffffff
 - 0xffffffff80000000 ~ 0xffffffffffffffff

In the rv64ilp32 ABI, 0x80000000 is illegal; hence, use a
temporary trap handler to zero-extend the address for jalr,
load and store operations.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 arch/riscv/kernel/head.S | 112 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index e55a92be12b1..bd2f30aa6d01 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -170,6 +170,118 @@ secondary_start_sbi:
 
 .align 2
 .Lsecondary_park:
+#ifdef CONFIG_ABI_RV64ILP32
+.option push
+.option norelax
+.option norvc
+	addiw sp, sp, -32
+
+	/* zext.w sp */
+	slli  sp, sp, 32
+	srli  sp, sp, 32
+
+	/* zext.w ra */
+	slli ra, ra, 32
+	srli ra, ra, 32
+
+	/* zext.w fp */
+	slli fp, fp, 32
+	srli fp, fp, 32
+
+	/* zext.w tp */
+	slli tp, tp, 32
+	srli tp, tp, 32
+
+	/* save tmp reg */
+	REG_S ra, 24(sp)
+	REG_S fp, 16(sp)
+	REG_S tp,  8(sp)
+	REG_S gp,  0(sp)
+
+	/* zext.w epc */
+	csrr ra, CSR_EPC
+	slli ra, ra, 32
+	srli ra, ra, 32
+	csrw CSR_SEPC, ra
+
+	csrr gp, CSR_CAUSE
+
+	/* EXC_INST_ACCESS */
+	addiw fp, gp, -1
+	beqz fp, 6f
+
+	/* EXC_LOAD_ACCESS */
+	addiw fp, gp, -5
+	beqz fp, 1f
+
+	/* EXC_STORE_ACCESS */
+	addiw fp, gp, -7
+	beqz fp, 1f
+
+	j 7f
+1:
+	/* get inst */
+	lw ra, 0(ra)
+	andi gp, ra, 0x3
+
+	/* c.(lw/sw/ld/sd)sp */
+	addiw fp, gp, -2
+	beqz fp, 6f
+
+	/* lw/sw/ld/sd */
+	addiw fp, gp, -3
+	beqz fp, 2f
+
+	/* c.(lw/sw/ld/sd) */
+	li fp, 0x7
+	slli fp, fp, 7
+	and ra, fp, ra
+	slli ra, ra, 8
+	j 3f
+
+2:
+	/* get rs1 */
+	li fp, 0x1f
+	slli fp, fp, 15
+	and ra, fp, ra
+
+3:
+	/* copy rs1 to rd */
+	mv fp, ra
+	srli fp, fp, 8
+	or ra, fp, ra
+
+	/* modify slli */
+	la fp, 4f
+	lw tp, 0(fp)
+	mv gp, tp
+	or tp, ra, tp
+	sw tp, 0(fp)
+	fence.i
+4:	slli x0, x0, 32
+	sw gp, 0(fp)
+
+	/* modify srli */
+	la fp, 5f
+	lw tp, 0(fp)
+	mv gp, tp
+	or tp, ra, tp
+	sw tp, 0(fp)
+	fence.i
+5:	srli x0, x0, 32
+	sw gp, 0(fp)
+
+6:
+	/* restore tmp reg */
+	REG_L ra, 24(sp)
+	REG_L fp, 16(sp)
+	REG_L tp,  8(sp)
+	REG_L gp,  0(sp)
+	addi sp, sp, 32
+	sret
+.option pop
+7:
+#endif
 	/*
 	 * Park this hart if we:
 	 *  - have too many harts on CONFIG_RISCV_BOOT_SPINWAIT
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
