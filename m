Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35DBC3600E
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 12:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1UCA9VlwUfPGEV+VAmScOnXrlUQDAH0/Huoembu63Mo=; b=qpqnBvt1n68wXt
	Ba2ecquyTtoEigGJONlUcxQd9td52yCDrbZSmRG2vga7/uCoOEAM++7FreEUsj2HSWIfDQpn8soEg
	4zpdZPI3Q6sZWUgc+KmKfKELWwMAWeyH31a+nuC1OSrX4SZf6C5cYhYZArlEpnQVJdGMH9t5dSuIo
	Vx1oj+xbe/LaAkElI72Kv377C0C3r3CK8HWL5MYMNQspbhAaC15Ioq5Ls08QvmwUIjqSSpNscEdcD
	vpniVdHRBtZLw347gQzxJ51KILiA7tMUPL7YvK+hjyTpwP/FNjLCQ32HqTZbB0va4DeVN7u9Fmcrl
	TxVRaEiOu7HFtGbfiODw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3YV-00000005rQE-2SJt;
	Tue, 25 Mar 2025 12:38:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3Ex-00000005mUs-2KTc;
	Tue, 25 Mar 2025 12:18:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E1EE743C2A;
	Tue, 25 Mar 2025 12:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D25C4CEED;
	Tue, 25 Mar 2025 12:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905123;
	bh=IoEFeh+m75KDxz7bIm+5+JPKqFD60PyKrITdPvnkO1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lucl4scHiNV8o0GAc3IKkqwvULaoWzPmEp5Cf3HWn54r4yb4FO0Wcun579c2vfuZz
	 J8cjJa3GTTzkMWx5VdBC4BoSRe3Rj4eXqqI4hKBSbaoTMZ+l2q1jnuJGFbX5wp6j2P
	 m4aeZBNLUPltdt6Ih13MGR6Div/iKVhSIZIxo4dWkQp8ORKrVGeC8JOoffP8TQadpr
	 bZFHGx2/54BhY+aa5gsFpFKEFifG6AH1a8qy5WxVap/Iz20XwOxa0fOKpKS0lOBu99
	 ve/Glkh5gV2+3Jeg8PA+Vog5uAShqNQ+riLO4RMDzBggckY3glJExTgraHapieY6+k
	 4nOhr50cYNVQA==
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
Subject: [RFC PATCH V3 08/43] rv64ilp32_abi: riscv: bitops: Adapt ctzw & clzw of zbb extension
Date: Tue, 25 Mar 2025 08:15:49 -0400
Message-Id: <20250325121624.523258-9-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_051843_653701_51EC4312 
X-CRM114-Status: UNSURE (   8.12  )
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

The RV64ILP32 ABI is based on 64-bit ISA, but BITS_PER_LONG is 32.
Use ctzw and clzw for int and long types instead of ctz and clz.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 arch/riscv/include/asm/bitops.h | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index c6bd3d8354a9..d041b9e3ba84 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -35,14 +35,27 @@
 #include <asm/alternative-macros.h>
 #include <asm/hwcap.h>
 
-#if (BITS_PER_LONG == 64)
+#if (__riscv_xlen == 64)
 #define CTZW	"ctzw "
 #define CLZW	"clzw "
+
+#if (BITS_PER_LONG == 64)
+#define CTZ	"ctz "
+#define CLZ	"clz "
 #elif (BITS_PER_LONG == 32)
+#define CTZ	"ctzw "
+#define CLZ	"clzw "
+#else
+#error "Unexpected BITS_PER_LONG"
+#endif
+
+#elif (__riscv_xlen == 32)
 #define CTZW	"ctz "
 #define CLZW	"clz "
+#define CTZ	"ctz "
+#define CLZ	"clz "
 #else
-#error "Unexpected BITS_PER_LONG"
+#error "Unexpected __riscv_xlen"
 #endif
 
 static __always_inline unsigned long variable__ffs(unsigned long word)
@@ -53,7 +66,7 @@ static __always_inline unsigned long variable__ffs(unsigned long word)
 
 	asm volatile (".option push\n"
 		      ".option arch,+zbb\n"
-		      "ctz %0, %1\n"
+		      CTZ "%0, %1\n"
 		      ".option pop\n"
 		      : "=r" (word) : "r" (word) :);
 
@@ -82,7 +95,7 @@ static __always_inline unsigned long variable__fls(unsigned long word)
 
 	asm volatile (".option push\n"
 		      ".option arch,+zbb\n"
-		      "clz %0, %1\n"
+		      CLZ "%0, %1\n"
 		      ".option pop\n"
 		      : "=r" (word) : "r" (word) :);
 
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
