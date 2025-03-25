Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D97C3600B
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 17:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWHSEaEK5CO3OWkxM0LvwOMtwOl/Hx2/aeVLoljymyw=; b=soS57IWWF18FX6
	qjkh45jsUPf6ABsAnyvYpc0/4/ph1XPpVvitEJ3qy/uvlsh7hYmZQVyz+azMH1+Bezrsq0kX8yYEz
	VxO06VHTC/tygTGmWW77c4fbfurFKf7UnAPa3cTAquFhODqTcK2T/cfm0lIyrXCCcdF/y6uxorTxp
	PxbNRhxO4U0UQX2iNSBiVip1S+I4UsBAtnEZbnIeaFgWEmX5OL0mMMi+U6b0OPOFZx7gwpvWXSOE/
	IgUw+P7m2Wj+MAWdPHspuKZX05Wg3sTiLIreM06wZgccqmU9OXTvzkq0+kUvu9WqVQhMRGFyogf/Z
	Dth5JeTbjDqt7TSgfKOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx7wW-00000006b7F-3qMb;
	Tue, 25 Mar 2025 17:20:00 +0000
Received: from mx01.omp.ru ([90.154.21.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx7wS-00000006b54-0U7a;
	Tue, 25 Mar 2025 17:19:58 +0000
Received: from [192.168.2.102] (213.87.136.199) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 25 Mar
 2025 20:19:41 +0300
Message-ID: <05fec753-cdaa-45a5-a029-b6435c30eb07@omp.ru>
Date: Tue, 25 Mar 2025 20:19:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH V3 25/43] rv64ilp32_abi: exec: Adapt 64lp64 env and
 argv
To: <guoren@kernel.org>, <arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<torvalds@linux-foundation.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <anup@brainfault.org>, <atishp@atishpatra.org>,
	<oleg@redhat.com>, <kees@kernel.org>, <tglx@linutronix.de>,
	<will@kernel.org>, <mark.rutland@arm.com>, <brauner@kernel.org>,
	<akpm@linux-foundation.org>, <rostedt@goodmis.org>, <edumazet@google.com>,
	<unicorn_wang@outlook.com>, <inochiama@outlook.com>, <gaohan@iscas.ac.cn>,
	<shihua@iscas.ac.cn>, <jiawei@iscas.ac.cn>, <wuwei2016@iscas.ac.cn>,
	<drew@pdp7.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<ctsai390@andestech.com>, <wefu@redhat.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <josef@toxicpanda.com>, <dsterba@suse.com>,
	<mingo@redhat.com>, <peterz@infradead.org>, <boqun.feng@gmail.com>,
	<xiao.w.wang@intel.com>, <qingfang.deng@siflower.com.cn>,
	<leobras@redhat.com>, <jszhang@kernel.org>, <conor.dooley@microchip.com>,
	<samuel.holland@sifive.com>, <yongxuan.wang@sifive.com>,
	<luxu.kernel@bytedance.com>, <david@redhat.com>, <ruanjinjie@huawei.com>,
	<cuiyunhui@bytedance.com>, <wangkefeng.wang@huawei.com>,
	<qiaozhe@iscas.ac.cn>
CC: <ardb@kernel.org>, <ast@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
	<kvm-riscv@lists.infradead.org>, <linux-mm@kvack.org>,
	<linux-crypto@vger.kernel.org>, <bpf@vger.kernel.org>,
	<linux-input@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <maple-tree@lists.infradead.org>,
	<linux-trace-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-atm-general@lists.sourceforge.net>, <linux-btrfs@vger.kernel.org>,
	<netfilter-devel@vger.kernel.org>, <coreteam@netfilter.org>,
	<linux-nfs@vger.kernel.org>, <linux-sctp@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-media@vger.kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
 <20250325121624.523258-26-guoren@kernel.org>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <20250325121624.523258-26-guoren@kernel.org>
X-Originating-IP: [213.87.136.199]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 03/25/2025 16:50:54
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 192097 [Mar 25 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 51 0.3.51
 68896fb0083a027476849bf400a331a2d5d94398
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.136.199
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 03/25/2025 16:52:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 3/25/2025 3:18:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_101956_159193_4D89D330 
X-CRM114-Status: UNSURE (   8.26  )
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

On 3/25/25 3:16 PM, guoren@kernel.org wrote:

> From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>
> 
> The rv64ilp32 abi reuses the env and argv memory layout of the
> lp64 abi, so leave the space to fit the lp64 struct layout.
> 
> Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
> ---
>  fs/exec.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/fs/exec.c b/fs/exec.c
> index 506cd411f4ac..548d18b7ae92 100644
> --- a/fs/exec.c
> +++ b/fs/exec.c
> @@ -424,6 +424,10 @@ static const char __user *get_user_arg_ptr(struct user_arg_ptr argv, int nr)
>  	}
>  #endif
>  
> +#if defined(CONFIG_64BIT) && (BITS_PER_LONG == 32)

   Parens don't seem necessary...

> +	nr = nr * 2;

   Why not nr *= 2?

[...]

MBR, Sergey


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
