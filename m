Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9AEC36011
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 12:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/+BftSjscJtnZ6UrLgJO2Vfa0mdEboDkDYW6TiJGus=; b=DcfZsOs94QUCGw
	Rp9xh5AugYbL2munnDQucsFn2YqBL9S505c1gXbNNhzCUFIF/8qi/+2yFjIxSInxY0Y+X0oKer6/+
	5fR4nVbfjga0Gr9DaciW8WztQ3//fCIxJCVVoxcjiICD9Mc5Hr3JjvEEjvzkYhs8LH/iHofQdAKin
	Lh1i4cSejDiPLGaxvEE8k1M0UcP/VC6ckmeNxb/pZ6toW5hR0CrWn22AtOeKpuNoYafTMYHpJMumY
	1ZWXpj1149VldRLvIlsUyMG2Bh8TuQv9w9rpMWN7NEtYlO5mj3RxzSq1PuYhcn1MNNwh/yntOMUVd
	kDj17iK4k+j0EKVRL44A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3dH-00000005tVc-1pvL;
	Tue, 25 Mar 2025 12:43:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3Lv-00000005oX7-1f15;
	Tue, 25 Mar 2025 12:25:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A3BE0A4A646;
	Tue, 25 Mar 2025 12:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98700C4CEE4;
	Tue, 25 Mar 2025 12:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905554;
	bh=eb9pFbZS3Y9m5tP2e5oU2ev4kJ8aZOyHuzMgMflfDxM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TKIbxeDg/4MGDoxGYhtsr77x8nD9+TpCG8oy/mBv1GHzr8ZWepo0+9u/qgnTYwhM7
	 9FoabPbbN9S6IfOf26oxS3m5p0frx/eThfy2pNkvlIe2k1adYFkjCwm3E3QYrPnnXY
	 qg1+2WeIhc8bsbGmrVaN8x2QJEpf+pJnOK1bpb9Cm3LPqRTJwuy9bTAStpIJuNhcng
	 U6oe1mYNc6XNsLp33CR0gMzzC0NbL9mf8zaoGaRdRBmnSf8sdgpDmPkIT5iWLXo5Lq
	 f6F/efG1+AqbmifuFranEddUppFwWnYxtFJSXivX7reLfW7B+/YSGNRM9ytoYkkqRu
	 QY3BUYNUiqCrw==
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
Subject: [RFC PATCH V3 38/43] rv64ilp32_abi: syscall: Use CONFIG_64BIT instead of BITS_PER_LONG
Date: Tue, 25 Mar 2025 08:16:19 -0400
Message-Id: <20250325121624.523258-39-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_052555_571757_73EB76CD 
X-CRM114-Status: UNSURE (   9.27  )
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

The RV64ILP32 ABI adopts the syscall rules from CONFIG_64BIT and
directly uses 64BIT, replacing BITS_PER_LONG representation.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 arch/riscv/include/asm/syscall_table.h | 2 +-
 arch/riscv/include/asm/unistd.h        | 4 ++--
 scripts/checksyscalls.sh               | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/syscall_table.h b/arch/riscv/include/asm/syscall_table.h
index 0c2d61782813..aab2bc0ddf4e 100644
--- a/arch/riscv/include/asm/syscall_table.h
+++ b/arch/riscv/include/asm/syscall_table.h
@@ -1,6 +1,6 @@
 #include <asm/bitsperlong.h>
 
-#if __BITS_PER_LONG == 64
+#ifdef CONFIG_64BIT
 #include <asm/syscall_table_64.h>
 #else
 #include <asm/syscall_table_32.h>
diff --git a/arch/riscv/include/asm/unistd.h b/arch/riscv/include/asm/unistd.h
index e6d904fa67c5..86b9c1712f24 100644
--- a/arch/riscv/include/asm/unistd.h
+++ b/arch/riscv/include/asm/unistd.h
@@ -16,10 +16,10 @@
 #define __ARCH_WANT_COMPAT_FADVISE64_64
 #endif
 
-#if defined(__LP64__) && !defined(__SYSCALL_COMPAT)
+#if defined(CONFIG_64BIT) && !defined(__SYSCALL_COMPAT)
 #define __ARCH_WANT_NEW_STAT
 #define __ARCH_WANT_SET_GET_RLIMIT
-#endif /* __LP64__ */
+#endif /* CONFIG_64BIT */
 
 #define __ARCH_WANT_MEMFD_SECRET
 
diff --git a/scripts/checksyscalls.sh b/scripts/checksyscalls.sh
index 1e5d2eeb726d..9cc4f9086dfe 100755
--- a/scripts/checksyscalls.sh
+++ b/scripts/checksyscalls.sh
@@ -76,7 +76,7 @@ cat << EOF
 #endif
 
 /* System calls for 32-bit kernels only */
-#if BITS_PER_LONG == 64
+#ifdef CONFIG_64BIT
 #define __IGNORE_sendfile64
 #define __IGNORE_ftruncate64
 #define __IGNORE_truncate64
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
