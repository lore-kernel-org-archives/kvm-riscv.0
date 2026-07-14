Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3EAC43458
	for <kvm-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 12:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZrwslA1972wbDyTTuQ+DI5SAGg6IsW5WusMzfLMng10=; b=oyT148Z4WSyxl5
	UGFNoztqibkJgDgnh2nxa49t3939uQyBjxdswZj9G5I2MKkn/tpCv/c4utZH7+Q5WumnxDZhH7gOI
	a0xzLAxUVwIVasj1MQgoiBIP5AQMXwtGfcxgv5VBd+Y2mqJKgR+/TZ3Cv249mF5QPAPrFJXUc96ZG
	PyiTctua21BwyzV59OvK0QmsWuYAuZ/BZzgYMBNzOD+D00sO+9IgdAFIWo6EjQYQhQcOpZNqBfJBh
	dZCueXdnRGkIuaa4iqgwENpstBVWRmIkER7MHCKDAc1aLT3UIyjNxfTkaWPKGc0YoYF7LG07LXdFS
	1qOvnsCNUnCNvzMzi6sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcL9-0000000BxRf-2nck;
	Tue, 14 Jul 2026 12:34:23 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcL6-0000000BxPI-2rFr
	for kvm-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 12:34:22 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47f365afc5aso1350568f8f.0
        for <kvm-riscv@lists.infradead.org>; Tue, 14 Jul 2026 05:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784032459; x=1784637259; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CcC3mXhC9vFPxE1TVGprdVmvuMWQZA/m1vfAGdGaT0s=;
        b=gfUlMiYg9Sl0ErZuZeFiSBhkUhH5MFb+SZ5RggYePukR0yH/G+ap2xlGYJEb4diDXP
         OetIWyKBvFS3tROJ2JYk9BJJyof/Hjd/jTGZ0uJyOa5jr4nolKBpSD9h+HSauRS7knoj
         RwU5Jkhu65ygDJb5VrgN/wRo29qk09xzJTAhrz+5P2DRgBUErZjQilRbebkEUEVF0hPQ
         Ed88ktfEqlJ22Jpfu356Buw7I4T+hIngSlLeE5vnHDxO1bKFFJzp/fwSOdomONmUlgbf
         TzUz+4z7B0CBI7Qyt6nXCQXmuBzWzI6bwpYCXqN8t2sP9beiOpH7auWxxP4v16JCdUbb
         ++mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784032459; x=1784637259;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CcC3mXhC9vFPxE1TVGprdVmvuMWQZA/m1vfAGdGaT0s=;
        b=qtliC1pxdDvp6W7M7gzHJgSZZEFUsJBKIdEC0W4fWhFKMJhMj/cd2eLZ3N4OtYu/vt
         eu9g9MpMdH/AYcfnjmzdXcXNVk1TLrgEaFqm7etzcNJ8gRCZHtqHnjI397pf5pWWvUtf
         bCmAjBojCshecmt+qkop3M3QTPSVuopS3IsVO2gKX+k2C3ROW79Bz1G2rTa6Hs0uodhC
         +wo1OJwT2ismfPw4/OnVMN9ebNB603F/8UgV/1/lyE6KootVSd8e33yIuDG99vKkJBip
         Cw5neEJb7fYU+Py83WnwUL+8L5wF2X74eLAqIujzjFeVEbWFL/secgmLXI9MhxJMkRUl
         LD5w==
X-Forwarded-Encrypted: i=1; AHgh+RoDK3feBXIVxASchP7U5ZPLHa6K0kyUMszQbruU/oj3f+Q2gRFbZkcR6zqhwiHPkoGG6WM/sGC1oTs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyaT7/y6j1oze66MqIHv1prIqAzL4oR2vPXc0JaN1SlwNTQUB10
	ce8Q7LGOIELyleYfN1UJgQpOAE8k+cxWSxRL86p4MQfw4pfa7WAcqag1
X-Gm-Gg: AfdE7ckG4+HULeExH58w3BMdu0+oC9dS5EJGGfImpbiKRVTdGfIE2M9k5smeGvKSyOp
	5IcFc6ZEXlJSh41Z2y2XCFz/nciq9TTpchM6tWGyzjXLAaLDPq5H7uTQjsHLZbJRGfADv/GqeqH
	OCA7GSdQ3uotJUQU8XPXOdfSVxoVxlLUmOJ7vB1SiUYpkQ2VPNXHHk4ouWmCJMJdj7S/Si1oHEp
	6+mJNDzr6R7sRdiNMQjpDRTLOMvlBA/R6NMsmV7fe37zeLrHqm29CFiOJbwWYCDj/NhBP76mU8H
	SradgR584K9hA6KEBtatP/B2D94PMv0DQmaqpvszR2oJvkTcrR/ezbvXgZ19lFVe/O4MAgg8n1L
	FcQ7V3bjcYp3Mk3uX3BlD8xrncUz3L8evt+IyLv3wVVyTpKBbQgoAh8sAIgs+7P+f93MjwKsoSi
	4RkxEbFYBQk6Uxy9AlM4IaI7fuGCUwNfkWgIGC7xewdU2pJlT1Smi1+wFFhDYx
X-Received: by 2002:a05:6000:4903:b0:47e:9d58:3b4e with SMTP id ffacd0b85a97d-47f4887f947mr2511343f8f.24.1784032458400;
        Tue, 14 Jul 2026 05:34:18 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c1f84sm8103524f8f.29.2026.07.14.05.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:34:18 -0700 (PDT)
Date: Tue, 14 Jul 2026 13:34:15 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-arch@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, linux-csky@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
 david@kernel.org, linux@armlinux.org.uk, akpm@linux-foundation.org,
 ankur.a.arora@oracle.com, rppt@kernel.org, linmag7@gmail.com,
 chleroy@kernel.org, klarasmodin@gmail.com, chenhuacai@kernel.org,
 kernel@xen0n.name, kas@kernel.org, zhangtianyang@loongson.cn,
 wangyuli@aosc.io, tsbogend@alpha.franken.de, ljs@kernel.org, jgg@ziepe.ca,
 catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
 ryan.roberts@arm.com, pasha.tatashin@soleen.com, rmclure@linux.ibm.com,
 baolin.wang@linux.alibaba.com, tj@kernel.org, kevin.brodsky@arm.com,
 anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 tglx@kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 hannes@cmpxchg.org, mhocko@kernel.org, qi.zheng@linux.dev,
 shakeel.butt@linux.dev, kasong@tencent.com, baohua@kernel.org,
 axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, vincenzo.frascino@arm.com, anshuman.khandual@arm.com,
 yang@os.amperecomputing.com, chaitanyas.prakash@arm.com, ardb@kernel.org,
 guoren@kernel.org, yang.li85200@gmail.com, viro@zeniv.linux.org.uk,
 dinguyen@kernel.org, schuster.simon@siemens-energy.com,
 wangruikang@iscas.ac.cn, junhui.liu@pigmoral.tech, muchun.song@linux.dev,
 vishal.moola@gmail.com, namcao@linutronix.de, pavel@kernel.org,
 djbw@kernel.org, yu-cheng.yu@intel.com, baolu.lu@linux.intel.com,
 Jonathan.Cameron@huawei.com, coxu@redhat.com, andreas@gaisler.com,
 liam@infradead.org, vbabka@kernel.org, surenb@google.com, mhocko@suse.com,
 geert@linux-m68k.org, shorne@gmail.com, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi
Subject: Re: [RFC PATCH 02/34] ARM: mm: make 2-level pgd_t a scalar
Message-ID: <20260714133415.78e25654@pumpkin>
In-Reply-To: <20260713135614.1618183-3-yeoreum.yun@arm.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
	<20260713135614.1618183-3-yeoreum.yun@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_053420_762878_92745ED7 
X-CRM114-Status: UNSURE (   8.57  )
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

On Mon, 13 Jul 2026 14:55:41 +0100
Yeoreum Yun <yeoreum.yun@arm.com> wrote:

> From: "David Hildenbrand (Arm)" <david@kernel.org>
> 
> We don't want pgd_t to be an array, as it prohibits returning it from a
> function, like pgdp_get().

If you use a two element structure the compiler/ABI might be able to
return that from a function in two registers.
That might make the entire mess more readable ...

	David

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
