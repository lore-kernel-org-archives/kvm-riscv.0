Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C07C35FFC
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 13:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tUxRzafGhfpOQ26L7B/JghFVa70Wa65NDocMP1iqPDU=; b=D76wVXCOKLoLC9cGvuwYBQlwL7
	eITOM5Duyp4m5l2SkWNzsyC9vc/vbS3Ro+rUqcrOYB+3BiZiL8r3BLy6EIL4+uKw40UCIwbSxMmT+
	iVAdq6YEcXsW+TF8t7b+FxYJEx6aPeTvk8LgEkZyeSj0uE+Hw+YG/PvAmJFeZS2AnugYPkWPKTw/Y
	auT9xA3f5sRWd4DFk9kW8H1QZJvcATpNxP/YoWQ3UhANa2I8vww6ISM0R70tDL9/2ZaH82zf8idEa
	eJ+hTMcGuyzOvteHzhP9K2Trnr5lvFtnR0loc9TsBK4SyvT+ZybS9Ax4FhtyRH9FKjfGN3DFaqdcj
	CKbCU2sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4B5-000000060Ro-0H11;
	Tue, 25 Mar 2025 13:18:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4B2-000000060R4-3WzJ;
	Tue, 25 Mar 2025 13:18:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7uJCsElQFNSpp9yzC8ZbXV0umGMGK1SA9vUHShT/4EA=; b=G+Y+PLPGq3KqRN134MwcYECwx1
	Jo0/C/tGmC3tu5hB9jzVzt4Cz139rgwQcs9uUR3SgaHP45avA+RNE5uCHDMflGCDDUbW/oP0pcgYY
	obNFihSbTPdgLEvgzI7LIyPBos5DMsPb+oSbVzULwEC8AJzjuHGtzt/ZNyXD6oaVotstt0CiP0JOo
	CsJViICw3lue1baW8m0SC8ypPFv+ACn30sdClgXvDg2ZaKSnMNEmIoffQtmbqD25TeBqeCydfgOgn
	ClUCiy0jicjnE4W1xDGxLo40SScG5ik5kixATiPi3TYH8EgDfd25N0p1oj/LSCZL50fy87cm9n3DK
	IvGCGmaQ==;
Received: from flow-b2-smtp.messagingengine.com ([202.12.124.137])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx4Az-00000005SJX-30ug;
	Tue, 25 Mar 2025 13:18:43 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailflow.stl.internal (Postfix) with ESMTP id 2825F1D4180B;
	Tue, 25 Mar 2025 09:18:34 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Tue, 25 Mar 2025 09:18:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742908714;
	 x=1742915914; bh=7uJCsElQFNSpp9yzC8ZbXV0umGMGK1SA9vUHShT/4EA=; b=
	RTmZlZugzrB2Xpp2UNcmLvJ2IMWE1xdWamWnVAKU5SL2JAeh+Vzm0Hxb/YmAQpL9
	mEwDWbQjzIx8gVGWNo0GPuIaibxKIdPeyAEapZyop9O5Rc5uyFfdcKWj0mXXSMHV
	tLwO/tb+6euKYNuN8vIwReVYQNxdhZzz2I3fCYWR5ISpjQrEgrTKfSAa4Tgb96FJ
	NNa5zvPiac2GlPmzCNKAS2OeK8aRzxprhy6dPptHE2iTkY1G7veSKjDOshKcIkI1
	NwEKOiSERdwYBqG5jZ84YGoyPos94OBmvljQjiCmF1cWxzKZZsaQrQNkJ10870a8
	HF71PKpsLcSgvdnbenoHmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1742908714; x=
	1742915914; bh=7uJCsElQFNSpp9yzC8ZbXV0umGMGK1SA9vUHShT/4EA=; b=B
	rsqAGkTFZ3e7xsyWdPC+FXwVIENkzzxocGOEQttZ5W+XR+GQpG4zAES5j4XgeCAd
	eD6S/IG0JPU4POYy8+9bTeUcSTeohmduHNbYSLdztyMoKfkDfg9G2NzngxuQGixe
	eFxOgaxRleW2TpHUcOSW9GfofxLfMGG9wCfGXT/joYzpEbxOPO7rs3hh4UFbFfb0
	Q4I0uXtwCKM17CbTMUdn151LDA7ZP089MSe7ujEUqAgobo5lJWYXNygdFIUSvaxn
	StCRqsm02WEA4qHGz0MwAqLsSWSHI8yWHtiBId1grcbZVOuf26de0t1VAbsZUzkt
	vt88I1ftKH2A7KsJ1ALJg==
X-ME-Sender: <xms:Jq3iZ6foBiaKuAmJ77lrBr7E2T7Lcf99ZyKD2TH6e7ywY8lOgI9B2A>
    <xme:Jq3iZ0M14fnjr8mp_r9sa4_yDoInwcEYNSlRBRpw6C_F5eC8tSdT45zsyFPOgjtme
    WNTc9fdahH8oEnzlxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvjeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    hedtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtthhsrghifeeltdesrghnug
    gvshhtvggthhdrtghomhdprhgtphhtthhopehmrghrkhdrrhhuthhlrghnugesrghrmhdr
    tghomhdprhgtphhtthhopegrthhishhhphesrghtihhshhhprghtrhgrrdhorhhgpdhrtg
    hpthhtohepphhrrggshhgrkhgrrhdrmhgrhhgruggvvhdqlhgrugdrrhhjsegsphdrrhgv
    nhgvshgrshdrtghomhdprhgtphhtthhopegrnhhuphessghrrghinhhfrghulhhtrdhorh
    hgpdhrtghpthhtoheptghuihihuhhnhhhuihessgihthgvuggrnhgtvgdrtghomhdprhgt
    phhtthhopehluhiguhdrkhgvrhhnvghlsegshihtvggurghntggvrdgtohhmpdhrtghpth
    htohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtohepsghoqhhunhdr
    fhgvnhhgsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:Jq3iZ7g34uWKZZn3icXtpFQzihVPUTQeXbqOQpkZwmLOq4QVBnjroA>
    <xmx:Jq3iZ3915FHYFpEO1oj9AmRy0IHdbHUk4bukRhLjZhwotBXSnjCRCw>
    <xmx:Jq3iZ2vlLc99g7elQeex6GPBmu2dFTbaYxfz1XMG2UET0XkMYYlaTQ>
    <xmx:Jq3iZ-FsMzw8YZ-IBw0ecwCIUEkUyjNSFiNcGn_QjfzWS3jB6OFPeA>
    <xmx:Ka3iZ-xINV5alrDEqFG5rfvPtST31BRU49C56iDy1-Cp7zOpC40jnXoJ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DF35E2220071; Tue, 25 Mar 2025 09:18:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T218a0d8b70d1a53d
Date: Tue, 25 Mar 2025 14:17:44 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Peter Zijlstra" <peterz@infradead.org>, guoren <guoren@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Anup Patel" <anup@brainfault.org>,
 "Atish Patra" <atishp@atishpatra.org>, "Oleg Nesterov" <oleg@redhat.com>,
 "Kees Cook" <kees@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Christian Brauner" <brauner@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Steven Rostedt" <rostedt@goodmis.org>,
 "Eric Dumazet" <edumazet@google.com>,
 "Chen Wang" <unicorn_wang@outlook.com>,
 "Inochi Amaoto" <inochiama@outlook.com>, gaohan@iscas.ac.cn,
 shihua@iscas.ac.cn, jiawei@iscas.ac.cn, wuwei2016@iscas.ac.cn,
 "Drew Fustini" <drew@pdp7.com>, "Lad,
 Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 ctsai390@andestech.com, wefu@redhat.com,
 "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 "Josef Bacik" <josef@toxicpanda.com>, "David Sterba" <dsterba@suse.com>,
 "Ingo Molnar" <mingo@redhat.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Xiao W Wang" <xiao.w.wang@intel.com>, qingfang.deng@siflower.com.cn,
 "Leonardo Bras" <leobras@redhat.com>,
 "Jisheng Zhang" <jszhang@kernel.org>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 "Samuel Holland" <samuel.holland@sifive.com>, yongxuan.wang@sifive.com,
 "Xu Lu" <luxu.kernel@bytedance.com>,
 "David Hildenbrand" <david@redhat.com>,
 "Ruan Jinjie" <ruanjinjie@huawei.com>,
 "Yunhui Cui" <cuiyunhui@bytedance.com>,
 "Kefeng Wang" <wangkefeng.wang@huawei.com>, qiaozhe@iscas.ac.cn,
 "Ard Biesheuvel" <ardb@kernel.org>,
 "Alexei Starovoitov" <ast@kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-mm@kvack.org,
 linux-crypto@vger.kernel.org, bpf@vger.kernel.org,
 linux-input@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>, maple-tree@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
 linux-atm-general@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 linux-nfs@vger.kernel.org, linux-sctp@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-media@vger.kernel.org
Message-Id: <db3c9923-8800-4ed3-a352-4ee9ef79c0b7@app.fastmail.com>
In-Reply-To: <20250325122640.GK36322@noisy.programming.kicks-ass.net>
References: <20250325121624.523258-1-guoren@kernel.org>
 <20250325122640.GK36322@noisy.programming.kicks-ass.net>
Subject: Re: [RFC PATCH V3 00/43] rv64ilp32_abi: Build CONFIG_64BIT kernel-self with
 ILP32 ABI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_131842_055604_5798EAE1 
X-CRM114-Status: GOOD (  19.41  )
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

On Tue, Mar 25, 2025, at 13:26, Peter Zijlstra wrote:
> On Tue, Mar 25, 2025 at 08:15:41AM -0400, guoren@kernel.org wrote:
>> From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>
>> 
>> Since 2001, the CONFIG_64BIT kernel has been built with the LP64 ABI,
>> but this patchset allows the CONFIG_64BIT kernel to use an ILP32 ABI
>
> Please, don't do this. This adds a significant maintenance burden on all
> of us.

It would be easier to this with CONFIG_64BIT disabled and continue
treating CONFIG_64BIT to be the same as BITS_PER_LONG=64, but I still
think it's fundamentally a bad idea to support this in mainline
kernels in any variation, other than supporting regular 32-bit
compat mode tasks on a regular 64-bit kernel.

>> The patchset targets RISC-V and is built on the RV64ILP32 ABI, which
>> was introduced into RISC-V's psABI in January 2025 [1]. This patchset
>> equips an rv64ilp32-abi kernel with all the functionalities of a
>> traditional lp64-abi kernel, yet restricts the address space to 2GiB.
>> Hence, the rv64ilp32-abi kernel simultaneously supports lp64-abi
>> userspace and ilp32-abi (compat) userspace, the same as the
>> traditional lp64-abi kernel.

You declare the syscall ABI to be the native 64-bit ABI, but this
is fundamentally not true because a many uapi structures are
defined in terms of 'long' or pointer values, in particular in
the ioctl call. This might work for an rv64ilp32 userspace that
uses the same headers and the same types, but you explicitly
say that the goal is to run native rv64 or compat rv32 tasks,
not rv64ilp32 (thanks!).

As far as I can tell, there is no way to rectify this design flaw
other than to drop support for 64-bit userspace and only support
regular rv32 userspace. I'm also skeptical that supporting rv64
userspace helps in practice other than for testing, since
generally most memory overhead is in userspace rather than the
kernel, and there is much more to gain from shrinking the larger
userspace by running rv32 compat mode binaries on a 64-bit kernel
than the other way round.

If you remove the CONFIG_64BIT changes that Peter mentioned and
the support for ilp64 userland from your series, you end up
with a kernel that is very similar to a native rv32 kernel
but executes as rv64ilp32 and runs rv32 userspace. I don't have
any objections to that approach, and the same thing has come
up on arm64 as a possible idea as well, but I don't know if
that actually brings any notable advantage over an rv32 kernel.

Are there CPUs that can run rv64 kernels and rv32 userspace
but not rv32 kernels, similar to what we have on Arm Cortex-A76
and Cortex-A510?

       Arnd

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
