Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEF2C36011
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 13:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iiavUNCZegHM36PjkdYwP9gMiww8hfjyL86rVsf9D9I=; b=x6EfmrAUY66dvM
	tgG9PotaKG8B6tO0PmX16kf74sJfQS/ChLZCjmd6VJ19eX7j9hALFQyFSayzFRjVgYaiipaa26xQU
	97ylv0uN0+m4IxwhlKWJbBsJPhFZpReUKfAmovnElW7XMNfnB2dp58vyaSiZhXmtvJneBZyZibck4
	/0Ab6aoTVS5dvHszsvbOAyMbhVLJVi7LaP9U5wXPtyl+rJ+tFSX2EpmWzYb4i3MR3HhhX+BR9I8sc
	mUTq7xckWKog+b5yUNl7X1MoTT/o4w7+tUaYSX9TWBE7CHH6OsIq2Ojkc/WWO/L8TvyA5+W4aoS9o
	+IU1Z+2zanRnlb2vJ14Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4iy-000000066S0-3Qn2;
	Tue, 25 Mar 2025 13:53:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3J6-00000005nfP-44Xg;
	Tue, 25 Mar 2025 12:23:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 536EA4368C;
	Tue, 25 Mar 2025 12:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E4CEC4CEE4;
	Tue, 25 Mar 2025 12:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905380;
	bh=kGPsHFFMg2CAbXtRnGFCoMZoeXyVXOmvw2ykjsD95WE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ntclLWycxIrsN91q9/Iq7DZLV3nwTWOf4Qo5f6R8yJlXo1s0ypvyO9gc8nw1n9iJa
	 FXE4HvXg9jbtr74bzaGhsm46h50G8b9MlQPjOkwWiuLMEejz6lYx8r2CpJVGHd+i84
	 Y9n4c1aA4xtTudNn6+y4oe79jba9Mxkk0kZFXd/7xCyMom+qmIyy4T/0ysXPzI7bay
	 5sdbYuoQbrTw4El0JuMiLQwd1ke34f9kjkg3HXYA3l/Iwam2xe4E80RyKMurhKZ1jo
	 s5Lzild3//u1NkkMe5ZEFU8hjrRZDyJHVc5UpBWJ9x1eZ2XWDKu2b3FH9QfncuRVF3
	 1ztYGTU3Jqe1Q==
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
Subject: [RFC PATCH V3 26/43] rv64ilp32_abi: file_ref: Use 32-bit width for refcnt
Date: Tue, 25 Mar 2025 08:16:07 -0400
Message-Id: <20250325121624.523258-27-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_052301_049562_64BFDBA9 
X-CRM114-Status: UNSURE (   8.84  )
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

The sizeof(atomic_t) is 4 in rv64ilp32 abi linux kernel, which
could provide a higher density of cache and a smaller memory
footprint.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 include/linux/file_ref.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/file_ref.h b/include/linux/file_ref.h
index 9b3a8d9b17ab..ce9b47359e14 100644
--- a/include/linux/file_ref.h
+++ b/include/linux/file_ref.h
@@ -27,7 +27,7 @@
  * 0xFFFFFFFFFFFFFFFFUL
  */
 
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 #define FILE_REF_ONEREF		0x0000000000000000UL
 #define FILE_REF_MAXREF		0x7FFFFFFFFFFFFFFFUL
 #define FILE_REF_SATURATED	0xA000000000000000UL
@@ -44,7 +44,7 @@
 #endif
 
 typedef struct {
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 	atomic64_t refcnt;
 #else
 	atomic_t refcnt;
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
