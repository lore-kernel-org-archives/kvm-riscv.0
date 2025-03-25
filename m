Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E8FFC36005
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 13:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a0Me+6c0bqmWskhYUoicYERNLSW82ke44/q/gLnWcDo=; b=BBPmBRbmyTS8LZ
	M13y4KsXrikQl2QfeWrlskkS6g9+QSgPQBGHM/ZOeEOYuBI0X62B+MuE6Q+chAWglvXuMRdFSsdaR
	pN3Jmi60pI0bb+KVrn3kYBQIne/xBxDgFy4EDScmvwg3eoc8vbVVMHQDNm/zsNH7zlb7QRR58gGRq
	uX3luN5K7MvaRY4FX6BCPhXALjY9CjtaMLG6qeH2EfUovOJ9kC5ZSACLcfdQaEpiw4HrXE1/9T9AF
	NhyPKL184mVVe9ZkaP/mRycI8vS3Mq5VguonaeWkSaZEvKcQ69zOal39oKlyCWJVolvi1ea010rDc
	6GRPxWymhsYjxRf2Op+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4ir-000000066HE-0OYw;
	Tue, 25 Mar 2025 13:53:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3Hh-00000005nEh-1zuz;
	Tue, 25 Mar 2025 12:21:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A332CA40948;
	Tue, 25 Mar 2025 12:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA472C4CEE4;
	Tue, 25 Mar 2025 12:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905292;
	bh=2jJgyb4FoTTfcF3Budy1LUhXG9H2Y2tw1xz71PydyxU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gz9tM3JywmMT22uwAGn8qB+80WAYV3v7Tgh0B3cb9T/BoswxR3T/k//AbqcuWEKLF
	 L4edD2clUau1Rpi1qbdeJXdbmBWHEi+zr+K+bY+S5OVJT+Z7Ij8LqPN4+oB1wJmn4L
	 TwL4dvh9smbkloOkN5N7/q5+M1EhCXtMHNIajyoIJo/07VkhxeQQZJKSQHjYyaQ+Fa
	 KHrViSi3S5tb9gQhPdFzLrO7vlzHmaGxIcQIxVasrFiSnuiKC9ZY2mJKzPZPtsmO7E
	 gi4u3P8cxdVd4W23j785rOpnmEAPzxlKxOy5Pd/d9VTUepXHGjCRYsCE81kr/SXvGT
	 b+Gh+GEiotvJg==
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
Subject: [RFC PATCH V3 20/43] rv64ilp32_abi: drivers/perf: Adapt xlen_t of sbiret
Date: Tue, 25 Mar 2025 08:16:01 -0400
Message-Id: <20250325121624.523258-21-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_052133_657058_2DC81654 
X-CRM114-Status: GOOD (  11.09  )
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

Because rv64ilp32_abi change the sbiret struct,

from:
struct sbiret {
        long error;
        long value;
};

to:
struct sbiret {
        xlen_t error;
        xlen_t value;
};

So, use a cast long to prevent compile warning.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 drivers/perf/riscv_pmu_sbi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 698de8ddf895..e2c4d1bcbc7c 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -638,7 +638,7 @@ static int pmu_sbi_snapshot_setup(struct riscv_pmu *pmu, int cpu)
 	/* Free up the snapshot area memory and fall back to SBI PMU calls without snapshot */
 	if (ret.error) {
 		if (ret.error != SBI_ERR_NOT_SUPPORTED)
-			pr_warn("pmu snapshot setup failed with error %ld\n", ret.error);
+			pr_warn("pmu snapshot setup failed with error %ld\n", (long)ret.error);
 		return sbi_err_map_linux_errno(ret.error);
 	}
 
@@ -679,7 +679,7 @@ static u64 pmu_sbi_ctr_read(struct perf_event *event)
 				val |= ((u64)ret.value << 32);
 			else
 				WARN_ONCE(1, "Unable to read upper 32 bits of firmware counter error: %ld\n",
-					  ret.error);
+					  (long)ret.error);
 		}
 	} else {
 		val = riscv_pmu_ctr_read_csr(info.csr);
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
