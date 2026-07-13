Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3DDC43458
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 15:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=t4TutSIuYjSupbj4NcvEEfRI2gkbNOn4f+iYWUTWbVo=; b=ibRklNZQOfzsAZgdh7v0cCLv7r
	cm50jZHBI9l+aLI29YOh3PMjIOGbYneE+lplUMDU6QwyyjNk95dWLGgyIXKLdkktpUdjeH/P/xdDa
	Om4yqlmSW4Nh9lOS4UVSbaa4iEQWmDCvp6HymAAvgImlJpBP/jn/CBIrzSjckmd/6mDbe+oY4BL2/
	5j0uEXzy1ZJJZ/Wej+yBt9dx57rWfTA1/pP61PqTHSoReyFCHxxak8bf/pwyq368oZKNebcKAVTsH
	fvREZ+r0ShPX95Rg5rk1j13Z5JsX6OgZCr4stmtnq8GEQAgKkoF2audff3KkENrlOTNIbP6rvRWva
	OoNEQxXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIlc-00000009p7l-2xF8;
	Mon, 13 Jul 2026 15:40:24 +0000
Received: from flow-b2-smtp.messagingengine.com ([202.12.124.137])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIlV-00000009p5y-3qRH;
	Mon, 13 Jul 2026 15:40:20 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id 1564713001CE;
	Mon, 13 Jul 2026 11:40:13 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Mon, 13 Jul 2026 11:40:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783957212;
	 x=1783964412; bh=63sZ2jVYn8LdZA7gH95m3khl+qIGq2b3k4vaJqArUP4=; b=
	iW4sWePT3v5RuiExrfF6A/7tVQ1jM80vt6+qaUuiSXX3xzi8TcKDoEMcLpC1Wycj
	YLGNDisot0aKbYabG11AiSqgAcEv+hchD7ePUn3Q7QegSB63SFitKnIvf8Ti5kJx
	Ow6wHq6FRA8HlIDy3+vSZ+o5LqkVyEACeWvE2KeOw18SdWdmOSIo/GUwP5W4SA6K
	mKTyKFVlWjx8My63P00L4s3EMdG8oh9p/ofSZoJXBBP4mbRVd+E+xZ0mPRjcLmAt
	WVCZZZf+RPZDpr59W8GBdVkmu2RsFbrHEETXg75tSH6h1O4S9IWJHkZnYe4bDtPg
	0VPe9WYzzmoe5YVydhyDvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783957212; x=
	1783964412; bh=63sZ2jVYn8LdZA7gH95m3khl+qIGq2b3k4vaJqArUP4=; b=U
	LQnKlUIywRVFQz2T48udoC33TJAoCXdIAZSeuGP1N0ZPr7fcEG7S0TpEcaVnVn+c
	G/SRa5VYTCQiMflK18sIgpnNhTHIZmCtVUou1s85jLllfrcplhXWmtZKcOfuxqKz
	9OQxUpM9VVkLqu+9JHpcM1AfRqAyklLXOkI+caA/S4eOsPJ5KLTh7w5jSxlilDkX
	8RFtQB2RucnR3YZ8hSAs6eIBOegmwS2ddCbQF+9kknh7pkz44rxlTKTyBe+AZOQ/
	ngdVzQah4hXX7/v48Y2rsKaJyDh0/T4dziQmFdciXJJWCTgGF//fvmhuxjpfTstx
	j1m7omfM4V4qrGYPJq3nw==
X-ME-Sender: <xms:2QZVajyDP5U2h6P0anHj9JfCWAn69RWfRVsmfSB45SDelYt8TMDVvA>
    <xme:2QZVamGc0XqHIvkwMsHO4mWsiOnb7hMXqrIg0Z9S0bntAfwEBmc3umVA2d79R592f
    N_MVD951nak7HALIaxj0ArFMqNFmrR1lPSWSEicJrK--CML9TnjJw>
X-ME-Proxy-Cause: dmFkZTGiBa7nyoJvLHpB9RMkM4BhBJPI163JjTDxEnYj0dxDppPFOS0iQb76r61dIHKZoH
    doew5BVKOzJl0BxEjQHPQAXL339ylWw9vfj91e6+EvGpmugWu4l6FgfHGT8veDQl14YlPk
    azrbgOlYeMoe8q4O6tOdPBWZ3gkfzjXB3MpP5ZSS4pVL3cODDv5o9sdlZZ82AnAYTD4dX1
    ZFEmxiB6y+c1WjQCjWbG2Tuy/F+AydS2qapXYfVj/nzoLQFdxYjff2W121CSyjD96Jqz/I
    RYFG+TB6hnYHG9pcozXzRhRj+7dUC7mbo9HM5um7P+xMaKCVbsxuHzrZLXSTZvkQV2DqfL
    ymeLwexCZPabJK55d5sxK/21hOkUFoUb+ExTnzslr1kLuW1SR9WWu7ZvVZMwIF4IWgoi/o
    j/VpQgVmgwhpVLtp5lgzTBmrTiT5gbnZ7Q7GXYbiO8QeTCwgQIZC6c35txMZjS6TWKAANZ
    lL+3RIdvFvspxp+zwMu1615CC5kCx8DC7tXphYZD0u/gz62IOXC21Cm6XtX7xtSF81yIbe
    SwtTDOBQfx6km50Rqc7jckoTHgvu2LsUahDrxwpgeQTFkFeEql548ztZEJ0FWTv/essIyv
    UwEUdfW3DUphCt4+X7M4Fr0an8HZRkO0QIWnSfi10X3VjRXmi2o6LGa4b21g
X-ME-Proxy: <xmx:2QZVaocb2-tYeEHCaWBxgGheyA65_oTe6yElM-79QvtibuE8CbqF-w>
    <xmx:2QZVahZIVXxuJflYOYjXtypUb3ndXfW6BSq6O-Nx5ec44O4MR9j6JQ>
    <xmx:2QZVat5rur89DlMEW9X7wm3q_ETqCbi-hkT8JmSntCdi1RMWYpE9dw>
    <xmx:2QZVamrLcy7aR6UUg0zEbQdsla3UgqHgVCBl_7RyAYMi3djwF8Z8Jg>
    <xmx:3AZVavasLut-hiuJDfIOSq7WvJC-hw5uzoQuGquD6DedXn23rWIKYKnL>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E2258182008C; Mon, 13 Jul 2026 11:40:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ASU80-mPZ9gg
Date: Mon, 13 Jul 2026 17:38:53 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yeoreum Yun" <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, linux-mm@kvack.org, kasan-dev@googlegroups.com,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-m68k@lists.linux-m68k.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>
Cc: "David Hildenbrand (Red Hat)" <david@kernel.org>,
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
Message-Id: <d57f5b18-583d-4848-9d74-65b15c93dcf8@app.fastmail.com>
In-Reply-To: <20260713135614.1618183-3-yeoreum.yun@arm.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
 <20260713135614.1618183-3-yeoreum.yun@arm.com>
Subject: Re: [RFC PATCH 02/34] ARM: mm: make 2-level pgd_t a scalar
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_084018_833967_1FA2A031 
X-CRM114-Status: UNSURE (   8.06  )
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

On Mon, Jul 13, 2026, at 15:55, Yeoreum Yun wrote:
> From: "David Hildenbrand (Arm)" <david@kernel.org>
>
> We don't want pgd_t to be an array, as it prohibits returning it from a
> function, like pgdp_get().

What should pgdp_get() return on ARM 2-stage page tables then?
Does it return just the first entry or concatenate the two?

> +typedef u64 pgdval_t;

> +static inline pmdval_t pgd_val(pgd_t pgd)
> +{
> +	return (*(pmdval_t (*)[2])&pgd)[0];
> +}

This could use a comment to explain what this actually
returns and why the second entry is discarded.

      Arnd

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
