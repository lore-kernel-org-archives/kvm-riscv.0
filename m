Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055F6C35FFC
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 13:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s6VQUbv3nEkTHqnW98A6FKd3YCs4gBusPI3x+le3Law=; b=5AAkvkIpWot8mo
	rDjgWQCsxrjoAZKlkZ3ClpuU7r7k6BxfurhaXMi9X2by6q4CIU2fM6t0eOvIv3prfeSY/+TjZnDkm
	Dw349fgfCVpXyyuGCk4M7huEHEgbFFK7mNxAs02UNsvwulUWGp9aG7a1ZTYmdi33mW96o/DyIf9EZ
	JdUnF25YQDJ0SlMzPv3v0y5hkPSvwj8IP641vWuYWsTK+pH86YhyrWuCNNU+9JtphZty0kOQD/YML
	KDDT54VOgShqVI9il88RXIXU4vif3tm7wOk33jLkoTZuCpth0GvK/cbIRyZCbFRXeEnTNWciSrGwA
	r6vvbCdP/uOeM7ivux9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4j0-000000066VD-2pNe;
	Tue, 25 Mar 2025 13:53:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3JL-00000005nk8-2pS8;
	Tue, 25 Mar 2025 12:23:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CDCAC61588;
	Tue, 25 Mar 2025 12:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EADAAC4CEED;
	Tue, 25 Mar 2025 12:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905394;
	bh=ZdAkreXNjU924DvNhCbpfQtujvhWVn4yr+yoUPb7XPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e0wh/8TxUniEX/ZB9PGz8ZaGiNSQaTZGsJyssDgFsfp+2sbfBlRKcQH+lkBCu3zaB
	 +q5JKkf/6/6G9uTXxsQGTjo+cVtnmWczJLZwsleSvMn8bvWHhxQEszuBw4x52yi9Bk
	 RNfQry6flnLoDYkb77T9WYq6b9r6RmFWBsHS2ig0gx5/AlMuJzcHEncwWe7YEL1iNP
	 87fpjQaGqgvuIa+FZFiDtwpz20AgIa6I0L4yQIwx2Bw4QTCN9Co6vjT0+kAHFSHwyB
	 wE+o43JlKf9U+bBptVGvCfBIgJ0CtZ70Z/obq8KrvHdjwDYUww471PY6i6UOaWxc62
	 UYzxYGeDDf+ug==
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
Subject: [RFC PATCH V3 27/43] rv64ilp32_abi: input: Adapt BITS_PER_LONG to dword
Date: Tue, 25 Mar 2025 08:16:08 -0400
Message-Id: <20250325121624.523258-28-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
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
BITS_PER_LONG is 32. So, adapt bits to dword with BITS_PER_LONG.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 drivers/input/input.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index c9e3ac64bcd0..7af5e8c66f25 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -1006,7 +1006,11 @@ static int input_bits_to_string(char *buf, int buf_size,
 	int len = 0;
 
 	if (in_compat_syscall()) {
+#if BITS_PER_LONG == 64
 		u32 dword = bits >> 32;
+#else
+		u32 dword = bits;
+#endif
 		if (dword || !skip_empty)
 			len += snprintf(buf, buf_size, "%x ", dword);
 
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
