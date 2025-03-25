Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BA1C3600E
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 12:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ttZ0RE9urflcql/kuxC2a7fn1FjSkuwKQRF28j45fPc=; b=ROGyWR5sUxxJXd
	jGHHS0JCCebC6x724MXcJijdzZ3CRuL+CMDSeSofao4xN4HPZRVmKGkMVtu3A29R6sCzOI85hzEdZ
	UY3cA1dbSqe4S3Iy9lcduRQypAbyVYZwp+j5KENbTqVQwkKjS+hrVBOeG6E2DXAWwz9ZWrKeK4VL9
	V8HR09R4dUZqjgFVlIrBb2f7wbB28z4plv3A7nUMGUo7ygIUvTSIbKbjBFUnCk5xBu1nif3KMnHUx
	Uacz+KXwei4/nHcgC2ylhdvCPq4YtlEukDT1n95KWxuAybHQdR0eZayNABJHUShPDJNggOBT2cpu8
	MLfeVXb6NI8C9dTA2nYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3dK-00000005ta9-1G36;
	Tue, 25 Mar 2025 12:43:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3MS-00000005og1-02F2;
	Tue, 25 Mar 2025 12:26:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2D989A4A68A;
	Tue, 25 Mar 2025 12:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B719EC4CEED;
	Tue, 25 Mar 2025 12:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905586;
	bh=CN5WMBcSq4ybkzYSZlZQi/bVyuOph6iTDFSpBV5o4N8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JUZLlaeIY8Hwh6lRUruQPwQasNliWPwz7cJWB27ghj4+IZjN2b4GbBZ/fSSZ6XMji
	 us+Hkvcz4IetM23aVYMu/AYs8cVXwsZBW7NeOsZgDbCgt6g5xqJd48sWMPOg1jFmZO
	 dTGKmsr8CcSEXGjzQ6k8LM44Bk1+QDQseKg+PcX8rq6xmuSZhGjpiAtIF0iRessEj3
	 aRKlIJp+k0H+q7J7Nwhehdmf4wV0LPBD/VdM8zp20s4PoYdcxn128IXf7LF6zj8Ai+
	 3WimUJp5bM0Px6NuLSmw5Ey3muirnPyNTnJB+ycI51xStVOVnALDfDoGBxJW8uVnSm
	 PDPGAqzidOZVg==
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
Subject: [RFC PATCH V3 40/43] rv64ilp32_abi: tracepoint-defs: Using u64 for trace_print_flags.mask
Date: Tue, 25 Mar 2025 08:16:21 -0400
Message-Id: <20250325121624.523258-41-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_052628_120649_B0A4320A 
X-CRM114-Status: UNSURE (   7.78  )
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

The rv64ilp32 ABI relies on CONFIG_64BIT, and mmflags.h defines
VMA flags with BIT_ULL. Consequently, use "unsigned long long"
for trace_print_flags.mask to align with VMAflag's type size.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 include/linux/tracepoint-defs.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/tracepoint-defs.h b/include/linux/tracepoint-defs.h
index aebf0571c736..3b51ede18e32 100644
--- a/include/linux/tracepoint-defs.h
+++ b/include/linux/tracepoint-defs.h
@@ -14,7 +14,11 @@
 struct static_call_key;
 
 struct trace_print_flags {
+#ifdef CONFIG_64BIT
+	unsigned long long	mask;
+#else
 	unsigned long		mask;
+#endif
 	const char		*name;
 };
 
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
