Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBBDC79F99
	for <kvm-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 20:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2U5cgCiW6VlORTQnR9NiqOem2mbdULmbz0KYYWWMGD8=; b=jS4tREAAo+8uoo
	KG6aQIAdfhLgh/kFTUsuaskrG9VdD1vkoR8bqDbd5QkeUdVJGRerEA0Ky+qMNg9AnPq8t4iPkQ56U
	Xh7XWMug9OQKyTgH7cCsBvlZiqJbFBYgz0/00LhM7IeNKcxtrp9UJObocVZBlSeCSU7cAa4gbu+lc
	R9JseMixP9QH2gjkTkB3haD3S5FeiVJcbtadCBA2RL9Nn1F/LcZtuasphpLR8LR68uIAh1ciZSdmn
	l29ddUHdqhPpUbpj3qUvnNrqSDbJTNaU7XO38wzCl4zPFw1U72lhjYy68IUqUvmViAAXW76Z2h33S
	gwox7v6jDAu2z9ComDSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42LP-0000000ABK3-1TFd;
	Tue, 08 Sep 2026 20:23:03 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42LN-0000000ABJL-2iJB
	for kvm-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 20:23:02 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d6ff3aca06so4685ad.0
        for <kvm-riscv@lists.infradead.org>; Tue, 08 Sep 2026 13:23:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788898980; cv=none;
        d=google.com; s=arc-20260327;
        b=nFEGOsli5hP6vd5KNwjGI2SUtNIFvQM7NunNnvkA0HkPyIHz2INtpbNqCTrTYKd9Jc
         R9jGvluPMStnWGWox8BqYIAMbSDWUB0PC9XheNYOul0kvEUZW9dj5VXeGDgEuIdL+9Na
         6fUOpmRa5lvrY4VIqErCvb2RQVsnvyHaSjBGezRzh+eSkgeM0bozVZskgOcVjx3AG7rF
         6L66IFx7Mei/iXQgnWF4hN2fB3HHBAovKbuVD9MVYnZnHE4GBVnErXndQQMrBoy2XhXk
         BbxML85X0ZaODF27RgPLn90cGBr2cdhS6Xq2PlcVJh2ggSJjeWdEEKalWs0HmNeOiePs
         kDhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TsLhOzf+D46xHpyx683mbvtqY0bc9njzNbabbHNEj0I=;
        fh=ixYhyr0oB6OoOfAVm7XcmWE4Enp9BXWG4ffSYvi19ZY=;
        b=sOaCVYi1X6R1Aiu6EHmrlgfZn2G2fyM43P4KnpALNSgSkvETxmqkRzaN5XOSe/p1Gq
         /DKf8xhHk9gau4mAwCLsbVvvBA4aGP2a4Kk/34YA0JXx87S08fTnTwcTtbwYR5DUlzl0
         rzGuR5+AUEKxgDKYbuLEkIcudpWG34LYSScAIdzuNHeGmFdAjotL4t1nfjv4FAZNFMlr
         HWhGOyDUTahVz0n+HDWTTEZMlea7UvNvZQZC/oPSR0N/8JMoIb2g/6hn/+9mOJlROy82
         +R10g5Evg3KOtE6WXeaeSUPy5H9WoRgRvSprFCaiyGPRNMRnLtpQlJ4fFmsCe2QNHiIh
         Cqrw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788898980; x=1789503780; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TsLhOzf+D46xHpyx683mbvtqY0bc9njzNbabbHNEj0I=;
        b=Is/AE4H33gRpfW6pN2PRrG1Ayewso6fKKqlciS0Wsc5wHOJzN0V09qwLxqmpk9aziZ
         VlCfECYDiIpbJYbpq4V3wFbnJK/4GRFTVcd5HOoRurOOwNZjqXYq88KsuDuW8V/cZJBi
         uHD0vRocJBbv/dOcdLlJNlAwaTjEK7MhYZpTdfnSKWLks4raP8P8QPe2ysvZOmfRCkk7
         iYtSQOC/h9Pk0gNs9wyV8oSJmIp9p8qv23wrq4XOTCiIzT17OTMUJGXynUXsc8CcKVYG
         BK69GC3bJeS5rjKz/8Debd2yHtVUBv8oInnWQDTLyUd6DCyliP/xBLE1v1sclFK6W0jX
         gcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788898980; x=1789503780;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TsLhOzf+D46xHpyx683mbvtqY0bc9njzNbabbHNEj0I=;
        b=MnxBOZSmbJ8qpg77PTKeSKqIajk/bJoX/sb5SUePcIovGOKPYh3tMqM2hKaMQNkFeq
         qt3J3B6ocU+bNEEmYFPCdW4/aO18OKmcyJjkbYkbknShv/8ObDZmRXxsV9s/lin3KgMj
         DPcC2+YZtnZTSCzEUzaTsWrkNJo1QXoArBVQTkQ1n0xAH8uznqvSjn9fs3aa/h0xsRX5
         QI6Gl9TCWzQW0j0eNRpKDnxZMas5Acp5OgR4JqCmaBDrLtFV8/luxP0otuqCXIbneBo5
         eNN0L0WykfmtHrjTrg4kTTHvptMDAvXsyGudmDd1g4Kh6uH+OfhKN0oRnDlqfjmSFMU5
         ikKw==
X-Forwarded-Encrypted: i=1; AKwUvBxa1r1Qa6CHv07Vw4i0HPUJVtkJ2KYGDSkw95cJ4UUJrLwRdT6ZTgDMdZ2urD8RnQWil2S+xrHXFRI=@lists.infradead.org
X-Gm-Message-State: AFuF++mYixg/i5GL3ZbxvtWz5pumCrfgRoollWS+iKrTS2F6yuj306Gq
	pZH+KnBFLvzDxM3YDTx6yTuQpIBBwRksQmOjjKAAtAlB3pLdIecSnXNwqCcdwEePRVAoa/EeyS0
	NYSTivhZErleHH2tVj8U5LWzf1c3GxIxM0FVOicPP
X-Gm-Gg: AYBFou0o6jfot6AnCkQJIe9c4oISmMjNWBpyKJphLvXxSnZIqyI+zcTuPMb1c1W1j+f
	LO7Pf7m33uGzBxv4Vux98G5LIGbNgDzCiz7lgZR0ziZyNk2OmWa2kXBZGqpEr+9AUdRiBlYKDol
	YEA38d9S7951+b+/EFQnrEmKfVhBXC+DapK6ZJVdwX0XkoBp4KBtzRovJVTNdsiIj9OPTZCm+rC
	Y2S9lI89Jaavks8WfeX0LO/PkGeAwsx/bstKf0QYingS42YgaJyBx3KRp2Xcw5P/4m5N74p/FPD
	zzqmO5jcJyA3/EMZZhoU0CcH9pfZlRqd6v1I2R6sZuAe6ui7Kecx9TAcuUHn1BITH/s3wAMAGEy
	kBmj8UV6L4+uex66p7esvuyAU4WZDb6vC
X-Received: by 2002:a17:903:fa4:b0:2d1:1d3d:97c3 with SMTP id
 d9443c01a7336-2dbfeccdf9bmr1436185ad.13.1788898978067; Tue, 08 Sep 2026
 13:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260908-b4-mmap-prepare-vma-flag-sanify-v1-0-dacf19cce22b@kernel.org>
 <20260908-b4-mmap-prepare-vma-flag-sanify-v1-11-dacf19cce22b@kernel.org>
In-Reply-To: <20260908-b4-mmap-prepare-vma-flag-sanify-v1-11-dacf19cce22b@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Tue, 8 Sep 2026 22:22:20 +0200
X-Gm-Features: AcwNN1W16jAho4HwK_fzY15wUA-qa4DGJ92-DrEx1Ojg_VFhiHj2JxDdZTxOKSI
Message-ID: <CAG48ez3Ucb8HyhjC1-fijFiYJsnWcTLYHvJjzMyU710mgegxnA@mail.gmail.com>
Subject: Re: [PATCH 11/39] selinux: reject writable opens of policy file, drop
 mmap shared/write check
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
 Miklos Szeredi <miklos@szeredi.hu>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_132301_685742_AC582DB7 
X-CRM114-Status: GOOD (  15.34  )
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

T24gVHVlLCBTZXAgOCwgMjAyNiBhdCAxMDowN+KAr1BNIExvcmVuem8gU3RvYWtlcyAoQVJNKSA8
bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+IFRoZSBwb2xpY3kgZmlsZSBoYXMgbm8gd3JpdGUgbWV0
aG9kIGFuZCBpcyBleHBvc2VkIHJlYWQtb25seSAoU19JUlVHTyBpbgo+IHNlbGludXhfZmlsZXNb
XSksIHlldCBzZWxfb3Blbl9wb2xpY3koKSBwZXJmb3JtcyBubyBvcGVuIG1vZGUgY2hlY2ssIHNv
IGEKPiBDQVBfREFDX09WRVJSSURFIGNhbGxlciBjYW4gb3BlbiBpdCBPX1JEV1IuIFJlamVjdCBG
TU9ERV9XUklURSBhdCBvcGVuLCBhcwo+IGtlcm5mcyBkb2VzLgo+Cj4gVGhlIGZpbGUgY2FuIHRo
ZW4gbmV2ZXIgYmUgbWFwcGVkIHdpdGggRk1PREVfV1JJVEUsIHNvIGRvX21tYXAoKSBhbHdheXMK
PiBjbGVhcnMgVk1fTUFZV1JJVEUgYW5kIFZNX1NIQVJFRCBmb3IgTUFQX1NIQVJFRCBtYXBwaW5n
cyBhbmQgdGhlIFZNX1NIQVJFRAo+IGNoZWNrIGluIHNlbF9tbWFwX3BvbGljeSgpIGNhbm5vdCBi
ZSByZWFjaGVkLiBSZW1vdmUgaXQuCgpZb3Ugc2hvdWxkIGFsc28gYmUgYWJsZSB0byByZW1vdmUg
dGhlIHNlbF9tbWFwX3BvbGljeV9vcHMucGFnZV9ta3dyaXRlCmhhbmRsZXIsIHdoaWNoIGlzIG9u
bHkgZm9yIHNoYXJlZC13cml0YWJsZSBmYXVsdHMsIHJpZ2h0PwoKPiBUaGlzIGFsc28gc3RvcHMg
c2VsX21tYXBfcG9saWN5KCkgY2xlYXJpbmcgVk1fTUFZV1JJVEUgb24gYSBtYXBwaW5nIHRoYXQg
aXMKPiBuZWl0aGVyIGEgUEZOIG1hcCBub3IgYSBtaXhlZCBtYXAsIGFoZWFkIG9mIHRoZSBjb3Jl
IGVuZm9yY2luZyB0aGF0IG9ubHkKPiBzdWNoIG1hcHBpbmdzIG1heSBkbyBzby4KPgo+IFNpZ25l
ZC1vZmYtYnk6IExvcmVuem8gU3RvYWtlcyAoQVJNKSA8bGpzQGtlcm5lbC5vcmc+CgpSZXZpZXdl
ZC1ieTogSmFubiBIb3JuIDxqYW5uaEBnb29nbGUuY29tPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5n
IGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
