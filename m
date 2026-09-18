Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99164C982D7
	for <kvm-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 20:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aj8o98DAJlFgyFneDV65DyRtZT3Okadr97JaaCHVR1w=; b=dgyKLa+cExE3Mh
	dLjpFCR98fazuCv5qB47maeBMXxiU/VUBoN0mv6Gdp7Q0MeH7WJrLgHLuYqYuFGEsJQyCayAFiic4
	gL2cpqDKPKwHYrcINDzL70B6mFb1QFVRbL1OLwuLMnlKdXtpFgLu94Nk+HI+3+weweBfiu6w0nDe8
	tRib0IOHIGQqT1mlteA4/32PuRG76BbkfkjRcvAiRuqbN1mmju0Ed0mWTLIS1GSq0tNv+42vnDSDp
	194++D0TYTjQu/Earcx8t/eqN45/P8voKD5pODbM3fHLoB/z+ISFHhba+8DBesI+wsVAE3XBb8Nkx
	BD+J3705Znfqzk/uetlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7fFI-0000000FVvd-14yl;
	Fri, 18 Sep 2026 20:31:44 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7fFE-0000000FVtu-3Iyv
	for kvm-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 20:31:42 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-530f6bcc301so54871cf.0
        for <kvm-riscv@lists.infradead.org>; Fri, 18 Sep 2026 13:31:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789763498; cv=none;
        d=google.com; s=arc-20260327;
        b=dLYkZzwIgNYwjgdX16TbfB4Zuah5FbmVHdb1h7CCZFuwz3DFskfgjiXojtv9C8cZ6p
         xPQMaZZwuZMoJVO49ouygpmVawhLc/KB5w1z/w5Mtlv6x4SZH7sx7hlrlu8xgZ/YfX24
         NPfudjCQcO2WJpsGxSu0hakbOxSDEumZfHJBp/sYnK+cahxw83EFJnuBsl9vrL2wRDmf
         Zg89tPl0uVjKO5lyTBt3hdLvRMYG1q75TW2NuWwO8rI3/fw/C6TTPj9ZXnUH1ioQKfZQ
         8g5XDCIpzHfwUb3UAF28nZKJp/7qmKMdLbloHuLQqqsb1Ma0elb9GofdGSovdXVj9+H/
         z1Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rakr0DVeS6w19WPN+xiAqZEbcFGWWdpHaQBH8HXSGgc=;
        fh=nT3/Hvqrq8AxDK+41i2JKFVc22JFTipUGFJ+4Su1gUo=;
        b=gAyVhaO+k0SVMcPHVnJI38dDogZDGA4HKIFoZUoJN/CZWceNnECYqs0fH4pCjIcFtF
         At7KgC4RuPh9eOGOCAl5ZHTFrwpUyCp31LlRlJgwlaC3V7FbdFzA7FwH6eKVfRO2E7mh
         ZGMDmkS51T1Uxt7anodA4WJJiloOWU1EWYG6PFJ2OIXVQ8BT2Wa/OrqEcduWGIsBZbt4
         DOHr8CwZJSQ+VZEZzk7xZ0WqgSIigSmWwgeGPI/T1aitCoULkiPMZCzBDu8dZ/ZX5tkr
         nMBYUhi6H18cIbTRZdTz5eQx5VzfFynYxZDDEuGIyALvATlmowC8iARs/PJf+0JUum0+
         aMrg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789763498; x=1790368298; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rakr0DVeS6w19WPN+xiAqZEbcFGWWdpHaQBH8HXSGgc=;
        b=lqdWahmQdEN5jlNq8q4x/To7wXF+dGLIn5BU9riTiTr8x8zWwvPJJ+w/ZpJf4vivis
         fYVYH+s9oUlo4c3b4Vev6knrtoIika8rojTTCNWSu9SQMatTj8nHkGRbCjoPbpfaPyfR
         R0qM9Q6m2zBEX9WyUAMMcSPatHutkwGCfzJO7Sh1J+I0oCVU3GNe7Y5njYeoECM0K9DM
         yi7JC5L3h3J7KeICAfumvaCrMbr1d/lvs9Es7f8Y180vHshtNiFRAOCyVWjHcLU/5UOG
         ji7l0QViL0a6v2elzaG8O5SFm6uso4tPcbX0QqiB1IvSyz/THb6kU5XF27AUky0hsJi1
         w1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789763498; x=1790368298;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rakr0DVeS6w19WPN+xiAqZEbcFGWWdpHaQBH8HXSGgc=;
        b=dbJlXoGvw7Y7ujhEx6jFn+JH42itSmLYhIb/ppzAjtgOKgGctJWD4KzH0Ckpm+5Sy6
         QsBeR6IKzsd5qQ/n5IuAcSrmwkk+LQrbolx+iY0eQlkAZ/hlUAOsD2LUXRk00Cn+9/EQ
         d2fpz4xg5SFIkGu/rsuZs2QWs62vFlpWXSjtLeFzZBrWQkOQWE9SKuRU/jhgPw6RsxOE
         RrByKjgNgt5KG48E3sIDhVBAxTurZc/E0PDDiyhXnDpwW7hf5VqFNU5VTZBzxrmCs/NY
         /Bme+N8+54zD1LOSUlVhuzy5L3CIDHFO33FNHRygojalkoXtscbo5TBZEhfFUHfHstin
         19Ag==
X-Forwarded-Encrypted: i=1; AKwUvBy6K68gG60LHN+Z9VPqhowtOfGcDJhJ+falWgl7DO3tWVbhuE0WSx2TKbSk/1pDvnTc+O0Qz5C8+Lk=@lists.infradead.org
X-Gm-Message-State: AFuF++mMny8uvYDd/KWtgMBTRFsFXPXj5Qi7R/EBp++EmhUoxYtCmZ74
	13etxD6NsPp0NFI5CQ2MEHxr7adRlmmoTgrGDmT725KONtqh0kvLV+7Nr0QxcJIiXUSdBWPoffi
	+ASd6ZsiECy2BDsBxwdQY/k3mk2ByjK7SALQy/ntO
X-Gm-Gg: AYBFou3vZOfLkPI8eS5PRTUjziVJAq/PFdXVygajFGHqX0YxApQ4WQpS9OYeDaM/u2L
	UtCkZ7H0WmvZRlu5ULPiFbMYfbaJrj6588TBPqxGeRygqpDr8ByjwpbFMP5tbjMcVxJCCKTlyVN
	dlbrWgkARkeg4r7Vl62Kqban8glUR0PspqJEvzN93IjGKPYszsYUo9D9hweRXlO8waVV/rtf4Bx
	qQCQl6+EL8nJ1Rxkqi9Ae8EAtKXhF+zRlw2UBUh8h1JQe96ckmwlVwclmjvdFKKJOd+rJNFbYYA
	0tJ0LRP9c4EKQdMbiKOF3RQsw2BInSgDwPGRJ+5lx0WduNBHrk2vWw==
X-Received: by 2002:ac8:5d08:0:b0:530:2f98:cebb with SMTP id
 d75a77b69052e-532b099561dmr605641cf.11.1789763497212; Fri, 18 Sep 2026
 13:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-b4-mmap-prepare-vma-flag-sanify-v2-0-7d9781ed5361@kernel.org>
 <20260914180811.057cba8fcc48d6e0b53a2683@linux-foundation.org> <0b064fe6-ddb3-4f26-a1f2-2e9dd88d590f@kernel.org>
In-Reply-To: <0b064fe6-ddb3-4f26-a1f2-2e9dd88d590f@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 18 Sep 2026 13:31:24 -0700
X-Gm-Features: AcwNN1VqLTR47MatnNlBWbpWA8EMmoQNGykspJvqoxdaovPnF0EYfRCWZF-8zh0
Message-ID: <CAJuCfpFBichJH4OcmSHTb1rOuQBT6k5pXeua9_KgpWjDBKvsYw@mail.gmail.com>
Subject: Re: [PATCH v2 00/40] mm: make VMA flag semantics explicit, eliminate VM_SPECIAL
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev, Takashi Iwai <tiwai@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_133140_847413_2A6E8655 
X-CRM114-Status: GOOD (  19.56  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBTZXAgMTgsIDIwMjYgYXQgMToyMeKAr1BNIERhdmlkIEhpbGRlbmJyYW5kIChBcm0p
CjxkYXZpZEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIDkvMTUvMjYgMDM6MDgsIEFuZHJldyBN
b3J0b24gd3JvdGU6Cj4gPiBPbiBNb24sIDE0IFNlcCAyMDI2IDE1OjU3OjIwICswMTAwICJMb3Jl
bnpvIFN0b2FrZXMgKEFSTSkiIDxsanNAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4+IFRoZSBW
TV9TUEVDSUFMIC8gVk1BX1NQRUNJQUxfRkxBR1MgbWFzayBjb25mbGF0ZXMgc2V2ZXJhbCB1bnJl
bGF0ZWQKPiA+PiBwcm9wZXJ0aWVzOgo+ID4+Cj4gPj4gLi4uCj4gPj4KPiA+PiBJdCdzIGFsbCBy
YXRoZXIgYSBtZXNzLgo+ID4+Cj4gPj4gVGhpcyBzZXJpZXMgYnJpbmdzIHNvbWUgb3JkZXIgdG8g
dGhpbmdzIGJ5IGJvdGggbGltaXRpbmcgd2hhdCBkcml2ZXJzIGNhbgo+ID4+IGRvIHdpdGggVk1B
IGZsYWdzIGFuZCBzd2l0Y2hpbmcgdG8gdXNpbmcgcHJlZGljYXRlcyB0aGF0IGRlc2NyaWJlCj4g
Pj4gYmVoYXZpb3VyLCBub3QgYXJiaXRyYXJ5IGZsYWdzLgo+ID4KPiA+IFRoYXQncyBhIGxvdCBv
ZiBwYXRjaGVzLgo+ID4KPiA+IFJldmlldyBpcyB0aGluIGFuZCBJIGV4cGVjdCB0aGlzIHdvbid0
IGltcHJvdmUgYSBsb3QuICBMb3RzIG9mICJubwo+ID4gZnVuY3Rpb25hbCBjaGFuZ2VzIiBjaGFu
Z2VzLgo+Cj4gSSdsbCBleHBlY3QgdG8gZ28gdGhyb3VnaCBhbGwgb2YgdGhlbS4gTWlnaHQganVz
dCB0YWtlIGEgYml0IDspCgpkaXR0bwoKPgo+IC0tCj4gQ2hlZXJzLAo+Cj4gRGF2aWQKCi0tIApr
dm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
