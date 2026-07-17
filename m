Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE318C44507
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 06:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tmcVIdtqMIGXBZ2pCZKbm6D9ucZoMnYSHjhTiXpemoY=; b=jn5qPj29Vxx0qsWtDPJridPk+h
	5OWo4EDTRgpAfZ9H6nNJUHwcSloiTUKiKDtteG1Xvf2/8T3Wrb6JIi2Vua3VP0SWZ+LEe11vsWkEY
	v3iDvbPS3BDwshzRWWq9yfAsIs2YcABVOtCh/PqDC4HhFSPebZ6BeAVczNrtJ/DQrbSMdKzrjlWPn
	o22pLlZn2r/1+KdqI4PUUzw+rsxA9O1BkGPZHhUsHmK5o+UA12HwIxbaigK4xr1N/34xKDSnIA4+f
	G1GrtshYIO1sXnkLJLELny9jRczPr/c/9A90eltd1vO2SIJjlqUgSDIxZr8TCPfPBfFsDpcuE0fdD
	FcaXmv9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbtv-00000001FZz-0Fwi;
	Fri, 17 Jul 2026 06:18:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbtt-00000001FZD-2wJF;
	Fri, 17 Jul 2026 06:18:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DIwsi7KwJyaKhQst6GtgDPKu/03zqC/ceJLNUsU0G7I=; b=bLrAuiaDCpI7wG4l1DDwVJaAqk
	fOuAjYnTuCwMlBwaw2vcRMo5ckUBFe9DFtwBXY4mUn00F3YFKDOg5nMzuMZ7VxmhPppqoanaxrMdl
	z2fqiFtWHykLawgWXCI3uWAInbgxL1hShaaQiQ1Rfa50nNhlyw6A9ZaDXzeaszGuDnobn9a4LBQAO
	VgVqk3U3OFJRkuS/E6na19mMxoM12XACzHEkLWJP36qR/1FAxOlP6CKTfLKy3AgLHWDx+/IHWjuZ+
	5MKqg9fcTHF8rdhWUGtFF19wpHHLx5uK/QlEnsdtC7AMwjQsGUIm6BBEWnInWU85hBJMRaUQZY2CW
	u6ryfvBg==;
Received: from flow-b7-smtp.messagingengine.com ([202.12.124.142])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkbtn-0000000EYuK-2zKn;
	Fri, 17 Jul 2026 06:18:18 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id C9D6E1300108;
	Fri, 17 Jul 2026 02:18:08 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 17 Jul 2026 02:18:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784269088;
	 x=1784276288; bh=DIwsi7KwJyaKhQst6GtgDPKu/03zqC/ceJLNUsU0G7I=; b=
	qJurhs5JdXDOPoUVTQH/c7wlS654Wk2iQcPnJ/CfxGI+lDliQ5WoXu9PkdWdggbW
	4d8b/pP1UoIb+cUshsR429F+4jAmsqxfXulbery4qx9QQ9L3k+CuBjhMRAcJ508P
	hkFpMA3/09yB51NIbjjASJyhc4gDS65tiI7/bPl+e6FpPcMswXKJWDAOkLhGoqnj
	HfqcoQ3m4Kfmmvcx/bzssrZ+hwlg6Dm2Q58Y1+XLiXurzsv9XLe/lU2RHonAjrmT
	Rv8BYN1KEYHV5Vnvxz9qEvOgjyUxplJIK+PqCHpYIathhx7GXGR9hFZ9zhMg6XKd
	bY7i6Vl1mKinY8/PcRF8Pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784269088; x=
	1784276288; bh=DIwsi7KwJyaKhQst6GtgDPKu/03zqC/ceJLNUsU0G7I=; b=S
	NFPT9EYrba01yD5+bxd0o86ReIuerWFEUX4KTVAPRJpdmcVvwba+/+L9NrYNYEqz
	GNFOhIqqFlmQEic5XKMgufYnt51BOVzJ8oDuEigx6ZTwQNCDwNABsx0yaefvPyAq
	OSVnT7Tk53WZGASdhTaErR5DhzAyaNihwPtUYvF8CprRClo4GENwngWSfd4DUaAQ
	EMRcoeeFZRfQ650IbUBfrdYE669ijsQbPxh0v80NFCLXPm16uJm+D7nmUC9SBQ0g
	dCX7TAfRWr6pfs/wSbK1bJr1MAJw50n1HthqFPfXnFg7BhG8N/GGqs/ei+tMgQeU
	WuOo19ntWRmsneHGOshlQ==
X-ME-Sender: <xms:HMlZagVQAqiQ2wrxcfzlM64OJgs_v7E5hozglxjLbZA3oFDx16Q4Sg>
    <xme:HMlZavZjC5M5VU4vv_x6XA8Q9mGZD-v9gYlS1ZunodCNZxSELR3_B5xqo0NQQ1Kkk
    S3Vnm8TCLvFoV9aetukmCzWBHrmtSXqTSyvspwykP4Js9EywzxWvA>
X-ME-Proxy-Cause: dmFkZTEsnogHl3/584/D3E3UL21JNIJ0IpLGex2XJCrBcpEOIptBGsASC8eWXQmjmgrrA+
    DsJi/6WKuBBi5F7OuvHSL+g/7EoKzEioTp1iZcObcFlCUdN9FQiLyhQ2WJckBsyhX/9Aho
    5zQIT0Bvwp2+NRIJWoZWWMC8SmjxWARp06CdfI/xQXVcnw57hiZzQkOQc2pwFGFa0PD3Ig
    VJ+Fd0xeZxtZewuZTM7xNyzpSHGuXpGq3mqq0soJ2shLfJD66nl9DGJFWVxpf76R9pb+Fn
    JOiGB9PJjr5FAsfP8hraRM4k548vGuSqGP1eA/PLgcn2VY+22D2Q5gmScaUtFJHkQeGQl0
    qOdJSMCXCOKVo2GYO0c8fM24yoitw5qkoNohPbWnf30vjF6onkva4ikrIgyRvIKEJvZNRA
    2o7FLDlhqcoPYk1+SmVJ4d4YE9GOtue1HKQ96xeNVuknOhecYVmSMo0VsLMLmjY8/FISBD
    gWTMCij41tnxpv39fvK9ULBw+8sWNQSqKe16iK2O+3X4VjSrm4lXzDGTiCUanjHSVT38ZI
    vviFiqNWzxfI/YQs5BbNcV3zIA9lOiFNZ/YeaHhcz7lLGZ/gbDMi5asWUg1zuEVqw7zMyu
    qV8v8QTwW2fXPoxCr2PY3YezqzuWa0Y6IrZCF0DlJYjYcHwuiRvpQbFeuHgw
X-ME-Proxy: <xmx:HMlZatns8IaYGj1VLUytOw4spltodteAcr4k00MZgvzHgwqZMovQtA>
    <xmx:HMlZahNXyXTuH2E6lbACeQcbmNWaNrYAiCMfDDD8K8uf2luwqFnldQ>
    <xmx:HMlZat5qsP5jnznKN1zDwch0mVoi_kuQo9F-CYJkyvhZNwwUsQEKRA>
    <xmx:HMlZaiL-pxHqt-gDvYbR-kuRnd0nkUgMhwofbEfTT8VK3P-i3s-mPw>
    <xmx:IMlZakFwaTi3Bb2V5_o7u3qejYOcKPIj7XfIuyMLQ8lJxF0u_ZM4Y94W>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0ADC3182007E; Fri, 17 Jul 2026 02:18:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ASU80-mPZ9gg
Date: Fri, 17 Jul 2026 08:16:55 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yeoreum Yun" <yeoreum.yun@arm.com>
Cc: "Pedro Falcato" <pfalcato@suse.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, linux-mm@kvack.org, kasan-dev@googlegroups.com,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-m68k@lists.linux-m68k.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Ankur Arora" <ankur.a.arora@oracle.com>,
 "Mike Rapoport" <rppt@kernel.org>, "Magnus Lindholm" <linmag7@gmail.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Klara Modin" <klarasmodin@gmail.com>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "Kirill A. Shutemov" <kas@kernel.org>, zhangtianyang@loongson.cn,
 wangyuli@aosc.io, "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Jason Gunthorpe" <jgg@ziepe.ca>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Pasha Tatashin" <pasha.tatashin@soleen.com>,
 "Rohan McLure" <rmclure@linux.ibm.com>,
 "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Tejun Heo" <tj@kernel.org>, "Kevin Brodsky" <kevin.brodsky@arm.com>,
 "Anup Patel" <anup@brainfault.org>, atish.patra@linux.dev,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Andy Lutomirski" <luto@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 "Johannes Weiner" <hannes@cmpxchg.org>,
 "Michal Hocko" <mhocko@kernel.org>, qi.zheng@linux.dev,
 "Shakeel Butt" <shakeel.butt@linux.dev>,
 "Kairui Song" <kasong@tencent.com>, "Barry Song" <baohua@kernel.org>,
 "Axel Rasmussen" <axelrasmussen@google.com>,
 "Yuanchu Xie" <yuanchu@google.com>, "Wei Xu" <weixugc@google.com>,
 "Andrey Ryabinin" <ryabinin.a.a@gmail.com>,
 "Alexander Potapenko" <glider@google.com>,
 "Andrey Konovalov" <andreyknvl@gmail.com>,
 "Dmitry Vyukov" <dvyukov@google.com>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Anshuman Khandual" <anshuman.khandual@arm.com>,
 "Yang Shi" <yang@os.amperecomputing.com>, chaitanyas.prakash@arm.com,
 "Ard Biesheuvel" <ardb@kernel.org>, guoren <guoren@kernel.org>,
 yang.li85200@gmail.com, "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Dinh Nguyen" <dinguyen@kernel.org>,
 "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>,
 "Vivian Wang" <wangruikang@iscas.ac.cn>, junhui.liu@pigmoral.tech,
 "Muchun Song" <muchun.song@linux.dev>,
 "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
 "Nam Cao" <namcao@linutronix.de>, "Pavel Machek" <pavel@kernel.org>,
 djbw@kernel.org, yu-cheng.yu@intel.com,
 "Baolu Lu" <baolu.lu@linux.intel.com>,
 "Jonathan Cameron" <Jonathan.Cameron@huawei.com>,
 "Coiby Xu" <coxu@redhat.com>, "Andreas Larsson" <andreas@gaisler.com>,
 "Liam R. Howlett" <liam@infradead.org>,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 "Suren Baghdasaryan" <surenb@google.com>,
 "Michal Hocko" <mhocko@suse.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Stafford Horne" <shorne@gmail.com>, "Jonas Bonn" <jonas@southpole.se>,
 "Stefan Kristiansson" <stefan.kristiansson@saunalahti.fi>
Message-Id: <4c3067df-20f0-43e8-8e62-354888afac04@app.fastmail.com>
In-Reply-To: <alkrWNECXmoxkrUC@e129823.arm.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
 <20260713135614.1618183-3-yeoreum.yun@arm.com> <alYL7B0HAvmLVHGU@pedro-suse>
 <b7dbc476-1477-4004-93b3-c5e667e24df8@app.fastmail.com>
 <alkrWNECXmoxkrUC@e129823.arm.com>
Subject: Re: [RFC PATCH 02/34] ARM: mm: make 2-level pgd_t a scalar
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_071816_841435_88404875 
X-CRM114-Status: GOOD (  17.24  )
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

On Thu, Jul 16, 2026, at 21:04, Yeoreum Yun wrote:
>>
>> > Ugh. This isn't correct C code. It only works because the kernel passes
>> > -fno-strict-aliasing.
>> 
>> I think the bigger problem is the code dereferencing the pgd
>> pointer in the first place: Since the pgd pair is written in
>> 32-bit units in __pmd_populate(), anything reading it would
>> technically have to operate on both entries.
>> 
>> As the kernel relies on -fno-strict-aliasing, the type mismatch
>> is less of a problem than actually doing the potentially wrong
>> thing.
>> 
>> As far as I can tell, we are however saved by pgd_val()
>> only ever being used for debug prints, where printing
>> the first entry is likely all that is needed to analyse
>> the real bug.
>> 
>> > I would recommend either forcing a struct here, or
>> > using a u64 with bitmasks/shifts.
>> 
>> That would require extra complexity for the big-endian
>> case though.
>
> Agree. And since the users of pgd_val() mostly uses with
> pmd_pfn(), pmd_page() and etc. I think it doesn't matter to return
> lower pmdval_t or higher one.
>
> Therefore, without considering endianess, it's enough with downcast
> like:
>
>    #define pgd_val(x)      ((pmdval_t)x)
>
> Could we apply this in next version?

I would just leave the original version here, at least it
keeps the current behavior for something that is easy to
get wrong. Taking the second entry on big-endian sounds
counterintuitive, especially when you have a hugetlb
mapping where the two don't just point to the same page.

      Arnd

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
