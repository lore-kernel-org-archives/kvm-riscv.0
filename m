Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038EEC35FFC
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 13:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yFr5ZjXLAs4ZNNw9gC13bStuJa+zKEG/6s3mncfSf9Y=; b=B+qXBGRVveq5M8
	jXmAJo+NM3gD/8uycS5Bp7hqo8DUI28yNbmalPkhYCufu2ifuX6Mbj+QB+EVSFlC1dA6RBE2/ZL/R
	LyaL6CEMsLc2odbqGtOft+gYeCdCcu9bXoIwf2DT6L+xzFYLEDtHPBvCVIyP0NHHVzHAoRFLbuVWc
	Qlkh8liZwItIf39+y7e3iepGTJwy57xUG+fAVW9pDcutTZAca8cZragHWbTTDHE83BF9pKQ5dCmLa
	3LWtPTGfWCKHlHaFYJi3JAcBYEf21/gHgAz+y8bi2IoE9f8SPm9E6tmpcSAeqzynTWBc5mNWzini/
	WS3TmxAeKew4pauOc+wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4j4-000000066bl-0YAh;
	Tue, 25 Mar 2025 13:53:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3Jn-00000005ntD-4A0l;
	Tue, 25 Mar 2025 12:23:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B1FB05C5557;
	Tue, 25 Mar 2025 12:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2AABC4CEE9;
	Tue, 25 Mar 2025 12:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905422;
	bh=UIaebIfG0R9TIRnbdttpSpkeO01MnZQH6Hjy2o37EAI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Db/QgCVyTP1KMjCiu2milpvC3qkLDNwk3mVRrlKUi/lDDidPq6IZsGUssESgSnXHT
	 8tlLCgF2DLpUf5AyzRz+b6VUbZToe3eNsINg1A5sW1DeN4FI3h6hqjvjGodEGNG3Mh
	 rXbNckGFXXUat8nF+OjELG2T7OAsRhxP5N1Ozf+PiFG4kcl8ToY6X3gRUFGuT59V6Y
	 YP+P1HiohUl8j+H6MaYzerQ0EVmocVtWqxn3ORYHJ6nPM6nrsNgTMbiFmnMTsB/FvM
	 VXYwY9CxVXMJeL/4Uaem46fFV73JfQLtYq07lKQaPXQyFsbq4ou++k7Q2Nf95Q6DAD
	 7iBflbn0swm5A==
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
Subject: [RFC PATCH V3 29/43] rv64ilp32_abi: locking/atomic: Use BITS_PER_LONG for scripts
Date: Tue, 25 Mar 2025 08:16:10 -0400
Message-Id: <20250325121624.523258-30-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_052344_173093_41437273 
X-CRM114-Status: UNSURE (   7.95  )
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

In RV64ILP32 ABI systems, BITS_PER_LONG equals 32 and determines
code selection, not CONFIG_64BIT.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 include/linux/atomic/atomic-long.h | 174 ++++++++++++++---------------
 scripts/atomic/gen-atomic-long.sh  |   4 +-
 2 files changed, 89 insertions(+), 89 deletions(-)

diff --git a/include/linux/atomic/atomic-long.h b/include/linux/atomic/atomic-long.h
index f86b29d90877..e31e0bdf9e26 100644
--- a/include/linux/atomic/atomic-long.h
+++ b/include/linux/atomic/atomic-long.h
@@ -9,7 +9,7 @@
 #include <linux/compiler.h>
 #include <asm/types.h>
 
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 typedef atomic64_t atomic_long_t;
 #define ATOMIC_LONG_INIT(i)		ATOMIC64_INIT(i)
 #define atomic_long_cond_read_acquire	atomic64_cond_read_acquire
@@ -34,7 +34,7 @@ typedef atomic_t atomic_long_t;
 static __always_inline long
 raw_atomic_long_read(const atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_read(v);
 #else
 	return raw_atomic_read(v);
@@ -54,7 +54,7 @@ raw_atomic_long_read(const atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_read_acquire(const atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_read_acquire(v);
 #else
 	return raw_atomic_read_acquire(v);
@@ -75,7 +75,7 @@ raw_atomic_long_read_acquire(const atomic_long_t *v)
 static __always_inline void
 raw_atomic_long_set(atomic_long_t *v, long i)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	raw_atomic64_set(v, i);
 #else
 	raw_atomic_set(v, i);
@@ -96,7 +96,7 @@ raw_atomic_long_set(atomic_long_t *v, long i)
 static __always_inline void
 raw_atomic_long_set_release(atomic_long_t *v, long i)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	raw_atomic64_set_release(v, i);
 #else
 	raw_atomic_set_release(v, i);
@@ -117,7 +117,7 @@ raw_atomic_long_set_release(atomic_long_t *v, long i)
 static __always_inline void
 raw_atomic_long_add(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	raw_atomic64_add(i, v);
 #else
 	raw_atomic_add(i, v);
@@ -138,7 +138,7 @@ raw_atomic_long_add(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_add_return(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_add_return(i, v);
 #else
 	return raw_atomic_add_return(i, v);
@@ -159,7 +159,7 @@ raw_atomic_long_add_return(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_add_return_acquire(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_add_return_acquire(i, v);
 #else
 	return raw_atomic_add_return_acquire(i, v);
@@ -180,7 +180,7 @@ raw_atomic_long_add_return_acquire(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_add_return_release(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_add_return_release(i, v);
 #else
 	return raw_atomic_add_return_release(i, v);
@@ -201,7 +201,7 @@ raw_atomic_long_add_return_release(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_add_return_relaxed(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_add_return_relaxed(i, v);
 #else
 	return raw_atomic_add_return_relaxed(i, v);
@@ -222,7 +222,7 @@ raw_atomic_long_add_return_relaxed(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_add(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_add(i, v);
 #else
 	return raw_atomic_fetch_add(i, v);
@@ -243,7 +243,7 @@ raw_atomic_long_fetch_add(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_add_acquire(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_add_acquire(i, v);
 #else
 	return raw_atomic_fetch_add_acquire(i, v);
@@ -264,7 +264,7 @@ raw_atomic_long_fetch_add_acquire(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_add_release(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_add_release(i, v);
 #else
 	return raw_atomic_fetch_add_release(i, v);
@@ -285,7 +285,7 @@ raw_atomic_long_fetch_add_release(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_add_relaxed(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_add_relaxed(i, v);
 #else
 	return raw_atomic_fetch_add_relaxed(i, v);
@@ -306,7 +306,7 @@ raw_atomic_long_fetch_add_relaxed(long i, atomic_long_t *v)
 static __always_inline void
 raw_atomic_long_sub(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	raw_atomic64_sub(i, v);
 #else
 	raw_atomic_sub(i, v);
@@ -327,7 +327,7 @@ raw_atomic_long_sub(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_sub_return(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_sub_return(i, v);
 #else
 	return raw_atomic_sub_return(i, v);
@@ -348,7 +348,7 @@ raw_atomic_long_sub_return(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_sub_return_acquire(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_sub_return_acquire(i, v);
 #else
 	return raw_atomic_sub_return_acquire(i, v);
@@ -369,7 +369,7 @@ raw_atomic_long_sub_return_acquire(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_sub_return_release(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_sub_return_release(i, v);
 #else
 	return raw_atomic_sub_return_release(i, v);
@@ -390,7 +390,7 @@ raw_atomic_long_sub_return_release(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_sub_return_relaxed(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_sub_return_relaxed(i, v);
 #else
 	return raw_atomic_sub_return_relaxed(i, v);
@@ -411,7 +411,7 @@ raw_atomic_long_sub_return_relaxed(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_sub(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_sub(i, v);
 #else
 	return raw_atomic_fetch_sub(i, v);
@@ -432,7 +432,7 @@ raw_atomic_long_fetch_sub(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_sub_acquire(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_sub_acquire(i, v);
 #else
 	return raw_atomic_fetch_sub_acquire(i, v);
@@ -453,7 +453,7 @@ raw_atomic_long_fetch_sub_acquire(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_sub_release(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_sub_release(i, v);
 #else
 	return raw_atomic_fetch_sub_release(i, v);
@@ -474,7 +474,7 @@ raw_atomic_long_fetch_sub_release(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_sub_relaxed(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_sub_relaxed(i, v);
 #else
 	return raw_atomic_fetch_sub_relaxed(i, v);
@@ -494,7 +494,7 @@ raw_atomic_long_fetch_sub_relaxed(long i, atomic_long_t *v)
 static __always_inline void
 raw_atomic_long_inc(atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	raw_atomic64_inc(v);
 #else
 	raw_atomic_inc(v);
@@ -514,7 +514,7 @@ raw_atomic_long_inc(atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_inc_return(atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_inc_return(v);
 #else
 	return raw_atomic_inc_return(v);
@@ -534,7 +534,7 @@ raw_atomic_long_inc_return(atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_inc_return_acquire(atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_inc_return_acquire(v);
 #else
 	return raw_atomic_inc_return_acquire(v);
@@ -554,7 +554,7 @@ raw_atomic_long_inc_return_acquire(atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_inc_return_release(atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_inc_return_release(v);
 #else
 	return raw_atomic_inc_return_release(v);
@@ -574,7 +574,7 @@ raw_atomic_long_inc_return_release(atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_inc_return_relaxed(atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_inc_return_relaxed(v);
 #else
 	return raw_atomic_inc_return_relaxed(v);
@@ -594,7 +594,7 @@ raw_atomic_long_inc_return_relaxed(atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_inc(atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_inc(v);
 #else
 	return raw_atomic_fetch_inc(v);
@@ -614,7 +614,7 @@ raw_atomic_long_fetch_inc(atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_inc_acquire(atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_inc_acquire(v);
 #else
 	return raw_atomic_fetch_inc_acquire(v);
@@ -634,7 +634,7 @@ raw_atomic_long_fetch_inc_acquire(atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_inc_release(atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_inc_release(v);
 #else
 	return raw_atomic_fetch_inc_release(v);
@@ -654,7 +654,7 @@ raw_atomic_long_fetch_inc_release(atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_inc_relaxed(atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_inc_relaxed(v);
 #else
 	return raw_atomic_fetch_inc_relaxed(v);
@@ -674,7 +674,7 @@ raw_atomic_long_fetch_inc_relaxed(atomic_long_t *v)
 static __always_inline void
 raw_atomic_long_dec(atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	raw_atomic64_dec(v);
 #else
 	raw_atomic_dec(v);
@@ -694,7 +694,7 @@ raw_atomic_long_dec(atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_dec_return(atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_dec_return(v);
 #else
 	return raw_atomic_dec_return(v);
@@ -714,7 +714,7 @@ raw_atomic_long_dec_return(atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_dec_return_acquire(atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_dec_return_acquire(v);
 #else
 	return raw_atomic_dec_return_acquire(v);
@@ -734,7 +734,7 @@ raw_atomic_long_dec_return_acquire(atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_dec_return_release(atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_dec_return_release(v);
 #else
 	return raw_atomic_dec_return_release(v);
@@ -754,7 +754,7 @@ raw_atomic_long_dec_return_release(atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_dec_return_relaxed(atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_dec_return_relaxed(v);
 #else
 	return raw_atomic_dec_return_relaxed(v);
@@ -774,7 +774,7 @@ raw_atomic_long_dec_return_relaxed(atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_dec(atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_dec(v);
 #else
 	return raw_atomic_fetch_dec(v);
@@ -794,7 +794,7 @@ raw_atomic_long_fetch_dec(atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_dec_acquire(atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_dec_acquire(v);
 #else
 	return raw_atomic_fetch_dec_acquire(v);
@@ -814,7 +814,7 @@ raw_atomic_long_fetch_dec_acquire(atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_dec_release(atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_dec_release(v);
 #else
 	return raw_atomic_fetch_dec_release(v);
@@ -834,7 +834,7 @@ raw_atomic_long_fetch_dec_release(atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_dec_relaxed(atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_dec_relaxed(v);
 #else
 	return raw_atomic_fetch_dec_relaxed(v);
@@ -855,7 +855,7 @@ raw_atomic_long_fetch_dec_relaxed(atomic_long_t *v)
 static __always_inline void
 raw_atomic_long_and(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	raw_atomic64_and(i, v);
 #else
 	raw_atomic_and(i, v);
@@ -876,7 +876,7 @@ raw_atomic_long_and(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_and(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_and(i, v);
 #else
 	return raw_atomic_fetch_and(i, v);
@@ -897,7 +897,7 @@ raw_atomic_long_fetch_and(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_and_acquire(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_and_acquire(i, v);
 #else
 	return raw_atomic_fetch_and_acquire(i, v);
@@ -918,7 +918,7 @@ raw_atomic_long_fetch_and_acquire(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_and_release(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_and_release(i, v);
 #else
 	return raw_atomic_fetch_and_release(i, v);
@@ -939,7 +939,7 @@ raw_atomic_long_fetch_and_release(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_and_relaxed(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_and_relaxed(i, v);
 #else
 	return raw_atomic_fetch_and_relaxed(i, v);
@@ -960,7 +960,7 @@ raw_atomic_long_fetch_and_relaxed(long i, atomic_long_t *v)
 static __always_inline void
 raw_atomic_long_andnot(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	raw_atomic64_andnot(i, v);
 #else
 	raw_atomic_andnot(i, v);
@@ -981,7 +981,7 @@ raw_atomic_long_andnot(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_andnot(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_andnot(i, v);
 #else
 	return raw_atomic_fetch_andnot(i, v);
@@ -1002,7 +1002,7 @@ raw_atomic_long_fetch_andnot(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_andnot_acquire(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_andnot_acquire(i, v);
 #else
 	return raw_atomic_fetch_andnot_acquire(i, v);
@@ -1023,7 +1023,7 @@ raw_atomic_long_fetch_andnot_acquire(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_andnot_release(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_andnot_release(i, v);
 #else
 	return raw_atomic_fetch_andnot_release(i, v);
@@ -1044,7 +1044,7 @@ raw_atomic_long_fetch_andnot_release(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_andnot_relaxed(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_andnot_relaxed(i, v);
 #else
 	return raw_atomic_fetch_andnot_relaxed(i, v);
@@ -1065,7 +1065,7 @@ raw_atomic_long_fetch_andnot_relaxed(long i, atomic_long_t *v)
 static __always_inline void
 raw_atomic_long_or(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	raw_atomic64_or(i, v);
 #else
 	raw_atomic_or(i, v);
@@ -1086,7 +1086,7 @@ raw_atomic_long_or(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_or(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_or(i, v);
 #else
 	return raw_atomic_fetch_or(i, v);
@@ -1107,7 +1107,7 @@ raw_atomic_long_fetch_or(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_or_acquire(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_or_acquire(i, v);
 #else
 	return raw_atomic_fetch_or_acquire(i, v);
@@ -1128,7 +1128,7 @@ raw_atomic_long_fetch_or_acquire(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_or_release(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_or_release(i, v);
 #else
 	return raw_atomic_fetch_or_release(i, v);
@@ -1149,7 +1149,7 @@ raw_atomic_long_fetch_or_release(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_or_relaxed(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_or_relaxed(i, v);
 #else
 	return raw_atomic_fetch_or_relaxed(i, v);
@@ -1170,7 +1170,7 @@ raw_atomic_long_fetch_or_relaxed(long i, atomic_long_t *v)
 static __always_inline void
 raw_atomic_long_xor(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	raw_atomic64_xor(i, v);
 #else
 	raw_atomic_xor(i, v);
@@ -1191,7 +1191,7 @@ raw_atomic_long_xor(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_xor(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_xor(i, v);
 #else
 	return raw_atomic_fetch_xor(i, v);
@@ -1212,7 +1212,7 @@ raw_atomic_long_fetch_xor(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_xor_acquire(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_xor_acquire(i, v);
 #else
 	return raw_atomic_fetch_xor_acquire(i, v);
@@ -1233,7 +1233,7 @@ raw_atomic_long_fetch_xor_acquire(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_xor_release(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_xor_release(i, v);
 #else
 	return raw_atomic_fetch_xor_release(i, v);
@@ -1254,7 +1254,7 @@ raw_atomic_long_fetch_xor_release(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_xor_relaxed(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_xor_relaxed(i, v);
 #else
 	return raw_atomic_fetch_xor_relaxed(i, v);
@@ -1275,7 +1275,7 @@ raw_atomic_long_fetch_xor_relaxed(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_xchg(atomic_long_t *v, long new)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_xchg(v, new);
 #else
 	return raw_atomic_xchg(v, new);
@@ -1296,7 +1296,7 @@ raw_atomic_long_xchg(atomic_long_t *v, long new)
 static __always_inline long
 raw_atomic_long_xchg_acquire(atomic_long_t *v, long new)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_xchg_acquire(v, new);
 #else
 	return raw_atomic_xchg_acquire(v, new);
@@ -1317,7 +1317,7 @@ raw_atomic_long_xchg_acquire(atomic_long_t *v, long new)
 static __always_inline long
 raw_atomic_long_xchg_release(atomic_long_t *v, long new)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_xchg_release(v, new);
 #else
 	return raw_atomic_xchg_release(v, new);
@@ -1338,7 +1338,7 @@ raw_atomic_long_xchg_release(atomic_long_t *v, long new)
 static __always_inline long
 raw_atomic_long_xchg_relaxed(atomic_long_t *v, long new)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_xchg_relaxed(v, new);
 #else
 	return raw_atomic_xchg_relaxed(v, new);
@@ -1361,7 +1361,7 @@ raw_atomic_long_xchg_relaxed(atomic_long_t *v, long new)
 static __always_inline long
 raw_atomic_long_cmpxchg(atomic_long_t *v, long old, long new)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_cmpxchg(v, old, new);
 #else
 	return raw_atomic_cmpxchg(v, old, new);
@@ -1384,7 +1384,7 @@ raw_atomic_long_cmpxchg(atomic_long_t *v, long old, long new)
 static __always_inline long
 raw_atomic_long_cmpxchg_acquire(atomic_long_t *v, long old, long new)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_cmpxchg_acquire(v, old, new);
 #else
 	return raw_atomic_cmpxchg_acquire(v, old, new);
@@ -1407,7 +1407,7 @@ raw_atomic_long_cmpxchg_acquire(atomic_long_t *v, long old, long new)
 static __always_inline long
 raw_atomic_long_cmpxchg_release(atomic_long_t *v, long old, long new)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_cmpxchg_release(v, old, new);
 #else
 	return raw_atomic_cmpxchg_release(v, old, new);
@@ -1430,7 +1430,7 @@ raw_atomic_long_cmpxchg_release(atomic_long_t *v, long old, long new)
 static __always_inline long
 raw_atomic_long_cmpxchg_relaxed(atomic_long_t *v, long old, long new)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_cmpxchg_relaxed(v, old, new);
 #else
 	return raw_atomic_cmpxchg_relaxed(v, old, new);
@@ -1454,7 +1454,7 @@ raw_atomic_long_cmpxchg_relaxed(atomic_long_t *v, long old, long new)
 static __always_inline bool
 raw_atomic_long_try_cmpxchg(atomic_long_t *v, long *old, long new)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_try_cmpxchg(v, (s64 *)old, new);
 #else
 	return raw_atomic_try_cmpxchg(v, (int *)old, new);
@@ -1478,7 +1478,7 @@ raw_atomic_long_try_cmpxchg(atomic_long_t *v, long *old, long new)
 static __always_inline bool
 raw_atomic_long_try_cmpxchg_acquire(atomic_long_t *v, long *old, long new)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_try_cmpxchg_acquire(v, (s64 *)old, new);
 #else
 	return raw_atomic_try_cmpxchg_acquire(v, (int *)old, new);
@@ -1502,7 +1502,7 @@ raw_atomic_long_try_cmpxchg_acquire(atomic_long_t *v, long *old, long new)
 static __always_inline bool
 raw_atomic_long_try_cmpxchg_release(atomic_long_t *v, long *old, long new)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_try_cmpxchg_release(v, (s64 *)old, new);
 #else
 	return raw_atomic_try_cmpxchg_release(v, (int *)old, new);
@@ -1526,7 +1526,7 @@ raw_atomic_long_try_cmpxchg_release(atomic_long_t *v, long *old, long new)
 static __always_inline bool
 raw_atomic_long_try_cmpxchg_relaxed(atomic_long_t *v, long *old, long new)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_try_cmpxchg_relaxed(v, (s64 *)old, new);
 #else
 	return raw_atomic_try_cmpxchg_relaxed(v, (int *)old, new);
@@ -1547,7 +1547,7 @@ raw_atomic_long_try_cmpxchg_relaxed(atomic_long_t *v, long *old, long new)
 static __always_inline bool
 raw_atomic_long_sub_and_test(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_sub_and_test(i, v);
 #else
 	return raw_atomic_sub_and_test(i, v);
@@ -1567,7 +1567,7 @@ raw_atomic_long_sub_and_test(long i, atomic_long_t *v)
 static __always_inline bool
 raw_atomic_long_dec_and_test(atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_dec_and_test(v);
 #else
 	return raw_atomic_dec_and_test(v);
@@ -1587,7 +1587,7 @@ raw_atomic_long_dec_and_test(atomic_long_t *v)
 static __always_inline bool
 raw_atomic_long_inc_and_test(atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_inc_and_test(v);
 #else
 	return raw_atomic_inc_and_test(v);
@@ -1608,7 +1608,7 @@ raw_atomic_long_inc_and_test(atomic_long_t *v)
 static __always_inline bool
 raw_atomic_long_add_negative(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_add_negative(i, v);
 #else
 	return raw_atomic_add_negative(i, v);
@@ -1629,7 +1629,7 @@ raw_atomic_long_add_negative(long i, atomic_long_t *v)
 static __always_inline bool
 raw_atomic_long_add_negative_acquire(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_add_negative_acquire(i, v);
 #else
 	return raw_atomic_add_negative_acquire(i, v);
@@ -1650,7 +1650,7 @@ raw_atomic_long_add_negative_acquire(long i, atomic_long_t *v)
 static __always_inline bool
 raw_atomic_long_add_negative_release(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_add_negative_release(i, v);
 #else
 	return raw_atomic_add_negative_release(i, v);
@@ -1671,7 +1671,7 @@ raw_atomic_long_add_negative_release(long i, atomic_long_t *v)
 static __always_inline bool
 raw_atomic_long_add_negative_relaxed(long i, atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_add_negative_relaxed(i, v);
 #else
 	return raw_atomic_add_negative_relaxed(i, v);
@@ -1694,7 +1694,7 @@ raw_atomic_long_add_negative_relaxed(long i, atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_fetch_add_unless(atomic_long_t *v, long a, long u)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_fetch_add_unless(v, a, u);
 #else
 	return raw_atomic_fetch_add_unless(v, a, u);
@@ -1717,7 +1717,7 @@ raw_atomic_long_fetch_add_unless(atomic_long_t *v, long a, long u)
 static __always_inline bool
 raw_atomic_long_add_unless(atomic_long_t *v, long a, long u)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_add_unless(v, a, u);
 #else
 	return raw_atomic_add_unless(v, a, u);
@@ -1738,7 +1738,7 @@ raw_atomic_long_add_unless(atomic_long_t *v, long a, long u)
 static __always_inline bool
 raw_atomic_long_inc_not_zero(atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_inc_not_zero(v);
 #else
 	return raw_atomic_inc_not_zero(v);
@@ -1759,7 +1759,7 @@ raw_atomic_long_inc_not_zero(atomic_long_t *v)
 static __always_inline bool
 raw_atomic_long_inc_unless_negative(atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_inc_unless_negative(v);
 #else
 	return raw_atomic_inc_unless_negative(v);
@@ -1780,7 +1780,7 @@ raw_atomic_long_inc_unless_negative(atomic_long_t *v)
 static __always_inline bool
 raw_atomic_long_dec_unless_positive(atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_dec_unless_positive(v);
 #else
 	return raw_atomic_dec_unless_positive(v);
@@ -1801,7 +1801,7 @@ raw_atomic_long_dec_unless_positive(atomic_long_t *v)
 static __always_inline long
 raw_atomic_long_dec_if_positive(atomic_long_t *v)
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	return raw_atomic64_dec_if_positive(v);
 #else
 	return raw_atomic_dec_if_positive(v);
@@ -1809,4 +1809,4 @@ raw_atomic_long_dec_if_positive(atomic_long_t *v)
 }
 
 #endif /* _LINUX_ATOMIC_LONG_H */
-// eadf183c3600b8b92b91839dd3be6bcc560c752d
+// 1b27315f1248fc8d43401372db7dd5895889c5be
diff --git a/scripts/atomic/gen-atomic-long.sh b/scripts/atomic/gen-atomic-long.sh
index 9826be3ba986..7667305381fc 100755
--- a/scripts/atomic/gen-atomic-long.sh
+++ b/scripts/atomic/gen-atomic-long.sh
@@ -55,7 +55,7 @@ cat <<EOF
 static __always_inline ${ret}
 raw_atomic_long_${atomicname}(${params})
 {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	${retstmt}raw_atomic64_${atomicname}(${argscast_64});
 #else
 	${retstmt}raw_atomic_${atomicname}(${argscast_32});
@@ -77,7 +77,7 @@ cat << EOF
 #include <linux/compiler.h>
 #include <asm/types.h>
 
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 typedef atomic64_t atomic_long_t;
 #define ATOMIC_LONG_INIT(i)		ATOMIC64_INIT(i)
 #define atomic_long_cond_read_acquire	atomic64_cond_read_acquire
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
