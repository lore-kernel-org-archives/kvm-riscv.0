Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7996EC3600E
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 13:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NaDRY5DJHCrOE3sXpiLPaYZj8z++CiLddbTJ5TYRZkg=; b=buki0vTkbCJPnT
	SveLdLgc+opSFZej0RXGD7Az195+uOC/AxOAcn+AJt1aLmN2A1JPKaJfo0HdrT8evc2gv53ppfVQ2
	qK322GCeomvFgJOPE+nqqECzONrFwvaInXM5qPNLpXt6fAbgEocQORYTEA6T5wyI5J2mB9VrfWYuU
	j8E44fYOPHoHgOccbBvd9EItcg1fozcvzIsT1/hy6RiEribX8P6oPamBLWn3ozs8Ams3EATJW5qRT
	dwecxeDKs5A0zvNaJf46DoUNRz7yGUvW9kY65yNNvOpIj0R7ELZg2vUEFwZE5ON+vdZ8mON0dc0VA
	Gzg6mpB6s5x4e2P9fUfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4is-000000066Iw-0wsZ;
	Tue, 25 Mar 2025 13:53:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3Hv-00000005nI7-3cuy;
	Tue, 25 Mar 2025 12:21:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 121CCA43621;
	Tue, 25 Mar 2025 12:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB6BC4CEEE;
	Tue, 25 Mar 2025 12:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905306;
	bh=CZdS/GvkA90YU/kEAB36wBveXCqjeNawAvE607HO4+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yclr6uQ+H+fwk4FeZuO/o1L+d44Ijt8+G1fy933XmRQHqYsRSsd0sTScvUWf8jhFn
	 posU+nxR0I0CJubB8JpreHpWy/aH5nvKFU2hJMpWF6yA979un6JU7n1rYErPHMB+OE
	 1HtLAfDLBJWL5lUcfbf0A+xaNH26BIwc5uqCly6rbYZnlIoX+horQoW9v4j5Sryd9B
	 XXw3PX/jNNQJEowJrGs9ycLTX55S8tjuI6nqYWKt5HT846Iutyoxz4uQ/nads2ZfRN
	 d2AZWWzbzkjb2I7at8nkI5Hq2azsuTC7jh77lOOfoH2dxmDMXNH64ns6YpTd/KRsOD
	 WXp0YdnLwIufw==
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
Subject: [RFC PATCH V3 21/43] rv64ilp32_abi: asm-generic: Add custom BITS_PER_LONG definition
Date: Tue, 25 Mar 2025 08:16:02 -0400
Message-Id: <20250325121624.523258-22-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_052148_035401_63F3924D 
X-CRM114-Status: UNSURE (   7.88  )
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

The RV64ILP32 ABI linux kernel is based on CONFIG_64BIT, but
BITS_PER_LONG is 32. So, give a custom architectural definition
of BITS_PER_LONG to match the correct macro definition.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 arch/riscv/include/uapi/asm/bitsperlong.h | 6 ++++++
 include/asm-generic/bitsperlong.h         | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/bitsperlong.h b/arch/riscv/include/uapi/asm/bitsperlong.h
index 7d0b32e3b701..fec2ad91597c 100644
--- a/arch/riscv/include/uapi/asm/bitsperlong.h
+++ b/arch/riscv/include/uapi/asm/bitsperlong.h
@@ -9,6 +9,12 @@
 
 #define __BITS_PER_LONG (__SIZEOF_POINTER__ * 8)
 
+#if __BITS_PER_LONG == 64
+#define BITS_PER_LONG 64
+#else
+#define BITS_PER_LONG 32
+#endif
+
 #include <asm-generic/bitsperlong.h>
 
 #endif /* _UAPI_ASM_RISCV_BITSPERLONG_H */
diff --git a/include/asm-generic/bitsperlong.h b/include/asm-generic/bitsperlong.h
index 1023e2a4bd37..7ccbb7ce6610 100644
--- a/include/asm-generic/bitsperlong.h
+++ b/include/asm-generic/bitsperlong.h
@@ -6,7 +6,9 @@
 
 
 #ifdef CONFIG_64BIT
+#ifndef BITS_PER_LONG
 #define BITS_PER_LONG 64
+#endif
 #else
 #define BITS_PER_LONG 32
 #endif /* CONFIG_64BIT */
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
