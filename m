Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805D8C36005
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 13:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gLgX+3FHHCu2IoASqC4OdmTXenBnBIBplDplKlb94FA=; b=K4I5ua8Na4Wlh+
	34NVCZfQa6SNHc9woO3K67phcUH4pQoL/Lkg5wYLLwavvt0qINjw1BxtgI1gTW8JZIO3xjTsNiTcY
	lR+y1zt17Sa1bb8uR/RMPLmL0L8U56Psl438wtEkYy0B1oRKGPe2ssWxrGfQUC7I9NGtEckcvb3AK
	UaqcOCeLkSvUhhtJJNWMwidflyJbNn5Q1Ss6NPejFU1G62U5oJ3gi5PkH/Q84mSUcCvWwQmgvWQ3E
	aodSoet7llOtVZuCpofMoRw/ycWXBl9x6shXgIYfNHOAIqEbeXcz25dHzkAqx9PlxnybSYAKsz/Hb
	9JpHaky7sbUWKkWoEZ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4ix-000000066Pb-0knp;
	Tue, 25 Mar 2025 13:53:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3Iq-00000005nap-0wjJ;
	Tue, 25 Mar 2025 12:22:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 742AE4368C;
	Tue, 25 Mar 2025 12:22:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6B6C4CEE9;
	Tue, 25 Mar 2025 12:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905363;
	bh=pRtaUMiFeAu+95a3CJwIpLTg/ZslxDoQ016dR5ldst0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p2sof5deaUnKxXsdbuejLa7cMfsQ/jfo9NR4yzxltIbGt9I7LGg3viUZpXT1k8RFw
	 9WTRwz7YQbBmvTKk30sv6fC7V/LIHte4FG9qKAIedqe9Y/ickF0YMfyR54zTwhm5BQ
	 obpUACKtQgLFBumRgfvC3WYEeXtPc/EwoiH4j3URzIqNlAo4TJWEvolJgwku1sqkJx
	 7rKaKFTW+8U8evbqHZ+v5cGHZoXKojJ2sQX8sVgxL7kldYux1laci0G+UGSLEZ94Hd
	 tb6MX1/sRkfPX52VC52FXAgkrmJ6qByYnTyzQlY4MscJzEO+hWOnTRGT/1TDXE8C38
	 5yNfgh3K5oAwg==
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
Subject: [RFC PATCH V3 25/43] rv64ilp32_abi: exec: Adapt 64lp64 env and argv
Date: Tue, 25 Mar 2025 08:16:06 -0400
Message-Id: <20250325121624.523258-26-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_052244_302225_29AE870C 
X-CRM114-Status: UNSURE (   7.70  )
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

The rv64ilp32 abi reuses the env and argv memory layout of the
lp64 abi, so leave the space to fit the lp64 struct layout.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 fs/exec.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/exec.c b/fs/exec.c
index 506cd411f4ac..548d18b7ae92 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -424,6 +424,10 @@ static const char __user *get_user_arg_ptr(struct user_arg_ptr argv, int nr)
 	}
 #endif
 
+#if defined(CONFIG_64BIT) && (BITS_PER_LONG == 32)
+	nr = nr * 2;
+#endif
+
 	if (get_user(native, argv.ptr.native + nr))
 		return ERR_PTR(-EFAULT);
 
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
