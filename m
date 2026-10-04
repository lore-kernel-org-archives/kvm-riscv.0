Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9081BCA5FF0
	for <kvm-riscv@archiver.kernel.org>; Sun,  4 Oct 2026 18:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XZ6fp+dqZKd44Py1htnUJHixCRrUHFUunFe3QCjdR6o=; b=jHYZCLYb4qB5Hf
	9W454sOHBn9b94GMSnXGETUnZphFfiAI5L7tNLbxWDkliBfaQOfQcCPZ00yhgPTolc7irXM0BkxtS
	XmCVxQPHwSK+UHYtpZz0r0+SZ8EtF82LgBmFDR1J8fMzhmytvF2mjM3Pychh0RoV8p4GYkv+1VOzE
	B9DJxlIjyNdOp+BWTg/IaQAizDfQlj4YM5gXtT1h4+ilKR7CKQIou5rdSCYLoBqnWPk0N+C+EZbMc
	6goSHXgz4fpFAC9VgQxEolxEa979/QvWiyDFk/66PkATLjaufXaUcs5UkcuXy4SmDVFE9o3PeyDE3
	4/kueWS+S89FIYgK2DAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDQel-0000000F9cz-3D3R;
	Sun, 04 Oct 2026 18:09:51 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDQej-0000000F9by-0k54
	for kvm-riscv@lists.infradead.org;
	Sun, 04 Oct 2026 18:09:50 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-5337c7b9937so263931cf.0
        for <kvm-riscv@lists.infradead.org>; Sun, 04 Oct 2026 11:09:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791137388; cv=none;
        d=google.com; s=arc-20260327;
        b=alVlBm3wY5sEL+0HOvKlpo2lOd8mxf6LyHTBZnq2fHzliqD2FMUAHE4ayLFw9BB2ol
         3VUmg3E9am+xkVFZu+bksuXpnwbLoAnxmJw+LH0C5L+4BBvt3opQ8eVhpCPJCust3a+z
         Ad0U9S8vwVax0hnyJG4k0BOcTpTcn3SpPDoF0HEHHrPfDEypJ5KL+LuyaOCYsyRHBzqh
         LlVcS+7xsdPij359fU5dHdaxjn456EzLRXHyppjDobO3w173iwsbXPNFiXNt2mYBvcew
         kyxR+4eYO+8oW+KR3DBcz3410y+73vLEtAGRacKN9FFbZaErBixiIxwKLPRDriznasRA
         nF5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XLyJnDD7le8j0fwG4PV8CX7G4WYRHL5RcOgxsV2u/6k=;
        fh=kvNHl9XsMTEtf7wZSUp0w3ujdgg3Kv0o2rjbVLgT/W4=;
        b=eB2Bu+6kdvwLQ9WA83R7UDdOZ6kKNph0screH6e6wRDLJc9IJb7wvgMZW4bAckEmOF
         Y50QPFgAs+ARErJ+GKEm7dQlAuQfNkbgSJl7iSvzOlvoZ6xb50qBWQ27FHgp+3rDAoqE
         vJdoyKeXc1AS/6Dwi14/ukoDqM5wZapX2L0IxV+nPb7SYnnB6w/8QhPRE+e733PMtfPu
         ZZ2zlNQWwIcBhwfjSyK2Pflyy3A8bFf8Tzr2WQ1XEU8I3VkAlIbxFdHeWzTpL0lv9ihv
         TXSYz/UKigsRlGjBGNDcIxNRLYwKNy1+pY+jam4G6xY1Oiw+Y9VpJileRXmeOFtnOYwj
         zGPg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791137388; x=1791742188; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XLyJnDD7le8j0fwG4PV8CX7G4WYRHL5RcOgxsV2u/6k=;
        b=YlXjEmadMb5PEe12T5JVQhvkIeTD8sK45dYgNfW4m0j5JWuhHMJDS/pHne6xrFD8QX
         OobhhBYYDZZDpoe8VxPpQ1TxRRJRVe/abfVf12B519+Aj4jHX56C1y4ZpqOQKxTl7tjv
         60comKGZMYJ09YYmF7w9krh5Dnq+tReyszVuYSosqS4OHhFr9gAx4dFLazO7W275vzHC
         zG9hhzVVWKxPfYMZ7Fc8qpEjUrh7ccLZgg1TvOwbzqP58T+UEY9vZ0uGA19ItwJx9OPF
         FhpB74cGq7RXZc1SC3u87VVk/f4kj+nV7sdPrpXSYfr6jyxnDGz6jCRnFdUxE1U7a8DG
         lvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791137388; x=1791742188;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XLyJnDD7le8j0fwG4PV8CX7G4WYRHL5RcOgxsV2u/6k=;
        b=Wy3EEEYISPiR0cq79h41pexd2KD602Dcoysz6cdBDZvR+1mvSSV3dt9jUVTF+8zr9g
         q/x/91eUZB3EW9zqFTLsHbnc6CnEDYoIoPE/bQAJ9xKagdyJApZlBLo80lZLlVMf5cSJ
         hDdyh57n7V+6YkR8mL24gaQYY5N7QhK0nRL5cujG+I8AOpg7uoW3ptdatCy1sLc31PEF
         kzySjdmEfpOyzVSk7m3tPX9fXqivX6yhU/HoMnXfi2xSTEM/nXEB6l3z22yVh4TVUOEp
         pF3vgq3D+NEO89sptMxrILj64jMpN12VgTvgfr1kXv+80mqm5E1UKX26ZpFudw6veYwY
         rjIg==
X-Forwarded-Encrypted: i=1; AKwUvBzrSnvprm/GO2pZ9dkhxeHzapjsiPdpFtf/oWaa+z6bBueHb3LPIzjLXKuetytj71mV3xUo/8jTEJI=@lists.infradead.org
X-Gm-Message-State: AFuF++lYOYmJonAe9RkrO5cYjp38M09vbz1jOYn+0GkzF+iqDOCwyhYC
	l4MKLtVMRLioqHPm+uylI5x+C45UH7BiVY8s0uWujeFbgxfJMJsinhD7/KauY3R/TXYJwgXKD8d
	zrVvAm1cF8CkZkjPqm08Ja/BK1wmhbSs1psONNvnM
X-Gm-Gg: AYBFou1KD/or/PQ7RJLcbSwvO+hx9bUCrX/ibEJx7jijTl8tAGKOz+B7YEHKwFYTMiq
	u68jM8AYntD2/3hHMcaeLB0hKGJ8ZX1NnUX9MfIR/sOqLcDaCPJTVgynHKHhMSxFvUbyUpJDHWT
	6fFc0iPQVNFR1nuwqVGBxpHz6cXVHXRPcZLO6UrPn7DdylUfRyLnDGJjVYhUEdH1yrpfjSykRqp
	uNiVFhlwDeyVRE3G7Cz42T2h03dr9XMdCcCZWxCVOTwc0077+E0t7NDcQDgKFxktlgTLJhLXMZr
	RgaYUeX4t3gRWFbnOmFbDvQ70OoU1h6VMy6iUCGtzMifyYaPBemeBXdj
X-Received: by 2002:a05:622a:e159:10b0:52f:9ed4:8d76 with SMTP id
 d75a77b69052e-535146449camr14146121cf.14.1791137386702; Sun, 04 Oct 2026
 11:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-0-a1f052500fd7@kernel.org>
 <20261003-b4-mmap-prepare-vma-flag-sanify-v4-19-a1f052500fd7@kernel.org>
In-Reply-To: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-19-a1f052500fd7@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 4 Oct 2026 11:09:35 -0700
X-Gm-Features: AclHuK-kwJ_Uo7kW-aV-ulJRzQPF_vjK2tdCaS-4gRgk6ACv9UztvH0OKE8MWEw
Message-ID: <CAJuCfpFKJ+31TZOWhwoTQTseOEy0AgAjz5eK9fdXmL40D0OY6Q@mail.gmail.com>
Subject: Re: [PATCH v4 19/38] HSI: cmt_speech: convert mmap hook to
 mmap_prepare, refactor
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_110949_250691_DF27B527 
X-CRM114-Status: GOOD (  24.92  )
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

T24gU2F0LCBPY3QgMywgMjAyNiBhdCA2OjM54oCvUE0gTG9yZW56byBTdG9ha2VzIChBUk0pIDxs
anNAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBVc2UgdGhlIG1tYXBfcHJlcGFyZSBpbiBmYXZvdXIg
b2YgdGhlIGRlcHJlY2F0ZWQgbW1hcCBob29rIGFzIHBhcnQgb2YgdGhlCj4gd29yayB0byBjb252
ZXJ0IG9uZSB0byBhbm90aGVyLgo+Cj4gU2luY2UgdGhpcyBpcyBzaW1wbHkgYSByZWZjb3VudGVk
IGtlcm5lbCBwYWdlIHRoYXQgaGFzIGJlZW4gYWxsb2NhdGVkLCBpdAo+IHNob3VsZCBub3QgYmUg
bWFya2VkIFZNX0lPIGFuZCBzaG91bGQgYmUgaW5zZXJ0ZWQgdXNpbmcgdGhlIGtlcm5lbCBwYWdl
Cj4gaW5zZXJ0aW9uIG1lY2hhbmlzbSwgc28gY29udmVydCBpdCB0byBkbyB0aGlzIGluc3RlYWQu
Cj4KPiBVc2UgdGhlIFZNQSBkZXNjcmlwdG9yJ3MgcHJpdmF0ZSBkYXRhIGZpZWxkIGFzIGEgc2Ny
YXRjaCBidWZmZXIgdG8gc3RvcmUKPiB0aGUgcGFnZSBpbiAtIHRoaXMgc3RheXMgdmFsaWQgdGhy
b3VnaG91dCB0aGUga2VybmVsIHBhZ2UgbWFwcGluZwo+IG9wZXJhdGlvbi4KPgo+IFNpZ25lZC1v
ZmYtYnk6IExvcmVuem8gU3RvYWtlcyAoQVJNKSA8bGpzQGtlcm5lbC5vcmc+CgpSZXZpZXdlZC1i
eTogU3VyZW4gQmFnaGRhc2FyeWFuIDxzdXJlbmJAZ29vZ2xlLmNvbT4KCgo+IC0tLQo+ICBkcml2
ZXJzL2hzaS9jbGllbnRzL2NtdF9zcGVlY2guYyB8IDMzICsrKysrKysrKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2hzaS9jbGllbnRzL2NtdF9zcGVlY2guYyBi
L2RyaXZlcnMvaHNpL2NsaWVudHMvY210X3NwZWVjaC5jCj4gaW5kZXggNzIyNjY3N2ViZGU3Li44
MDE2OTdiNzRkNGYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9oc2kvY2xpZW50cy9jbXRfc3BlZWNo
LmMKPiArKysgYi9kcml2ZXJzL2hzaS9jbGllbnRzL2NtdF9zcGVlY2guYwo+IEBAIC0xMDg0LDIy
ICsxMDg0LDYgQEAgc3RhdGljIHZvaWQgY3NfaHNpX3N0b3Aoc3RydWN0IGNzX2hzaV9pZmFjZSAq
aGkpCj4gICAgICAgICBrZnJlZShoaSk7Cj4gIH0KPgo+IC1zdGF0aWMgdm1fZmF1bHRfdCBjc19j
aGFyX3ZtYV9mYXVsdChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKPiAtewo+IC0gICAgICAgc3RydWN0
IGNzX2NoYXIgKmNzZGF0YSA9IHZtZi0+dm1hLT52bV9wcml2YXRlX2RhdGE7Cj4gLSAgICAgICBz
dHJ1Y3QgcGFnZSAqcGFnZTsKPiAtCj4gLSAgICAgICBwYWdlID0gdmlydF90b19wYWdlKCh2b2lk
ICopY3NkYXRhLT5tbWFwX2Jhc2UpOwo+IC0gICAgICAgZ2V0X3BhZ2UocGFnZSk7Cj4gLSAgICAg
ICB2bWYtPnBhZ2UgPSBwYWdlOwo+IC0KPiAtICAgICAgIHJldHVybiAwOwo+IC19Cj4gLQo+IC1z
dGF0aWMgY29uc3Qgc3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0IGNzX2NoYXJfdm1fb3BzID0g
ewo+IC0gICAgICAgLmZhdWx0ICA9IGNzX2NoYXJfdm1hX2ZhdWx0LAo+IC19Owo+IC0KPiAgc3Rh
dGljIGludCBjc19jaGFyX2Zhc3luYyhpbnQgZmQsIHN0cnVjdCBmaWxlICpmaWxlLCBpbnQgb24p
Cj4gIHsKPiAgICAgICAgIHN0cnVjdCBjc19jaGFyICpjc2RhdGEgPSBmaWxlLT5wcml2YXRlX2Rh
dGE7Cj4gQEAgLTEyNTYsMTggKzEyNDAsMTkgQEAgc3RhdGljIGxvbmcgY3NfY2hhcl9pb2N0bChz
dHJ1Y3QgZmlsZSAqZmlsZSwgdW5zaWduZWQgaW50IGNtZCwKPiAgICAgICAgIHJldHVybiByOwo+
ICB9Cj4KPiAtc3RhdGljIGludCBjc19jaGFyX21tYXAoc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+ICtzdGF0aWMgaW50IGNzX2NoYXJfbW1hcF9wcmVwYXJl
KHN0cnVjdCB2bV9hcmVhX2Rlc2MgKmRlc2MpCj4gIHsKPiAtICAgICAgIGlmICh2bWEtPnZtX2Vu
ZCA8IHZtYS0+dm1fc3RhcnQpCj4gLSAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsg
ICAgICAgc3RydWN0IGZpbGUgKmZpbGUgPSBkZXNjLT5maWxlOwo+ICsgICAgICAgc3RydWN0IGNz
X2NoYXIgKmNzZGF0YSA9IGZpbGUtPnByaXZhdGVfZGF0YTsKPiArICAgICAgIHN0cnVjdCBwYWdl
ICoqcGFnZXMgPSAoc3RydWN0IHBhZ2UgKiopJmRlc2MtPnByaXZhdGVfZGF0YTsKPgo+IC0gICAg
ICAgaWYgKHZtYV9wYWdlcyh2bWEpICE9IDEpCj4gKyAgICAgICBpZiAodm1hX2Rlc2NfcGFnZXMo
ZGVzYykgIT0gMSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4KPiAtICAgICAg
IHZtX2ZsYWdzX3NldCh2bWEsIFZNX0lPIHwgVk1fRE9OVERVTVAgfCBWTV9ET05URVhQQU5EKTsK
PiAtICAgICAgIHZtYS0+dm1fb3BzID0gJmNzX2NoYXJfdm1fb3BzOwo+IC0gICAgICAgdm1hLT52
bV9wcml2YXRlX2RhdGEgPSBmaWxlLT5wcml2YXRlX2RhdGE7Cj4gKyAgICAgICB2bWFfZGVzY19z
ZXRfZmxhZ3MoZGVzYywgVk1BX0RPTlREVU1QX0JJVCwgVk1BX0RPTlRFWFBBTkRfQklUKTsKPgo+
ICsgICAgICAgKnBhZ2VzID0gdmlydF90b19wYWdlKCh2b2lkICopY3NkYXRhLT5tbWFwX2Jhc2Up
Owo+ICsgICAgICAgbW1hcF9hY3Rpb25fbWFwX2tlcm5lbF9wYWdlc19mdWxsKGRlc2MsIHBhZ2Vz
KTsKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiBAQCAtMTM1Myw3ICsxMzM4LDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgY3NfY2hhcl9mb3BzID0gewo+ICAgICAg
ICAgLndyaXRlICAgICAgICAgID0gY3NfY2hhcl93cml0ZSwKPiAgICAgICAgIC5wb2xsICAgICAg
ICAgICA9IGNzX2NoYXJfcG9sbCwKPiAgICAgICAgIC51bmxvY2tlZF9pb2N0bCA9IGNzX2NoYXJf
aW9jdGwsCj4gLSAgICAgICAubW1hcCAgICAgICAgICAgPSBjc19jaGFyX21tYXAsCj4gKyAgICAg
ICAubW1hcF9wcmVwYXJlICAgPSBjc19jaGFyX21tYXBfcHJlcGFyZSwKPiAgICAgICAgIC5vcGVu
ICAgICAgICAgICA9IGNzX2NoYXJfb3BlbiwKPiAgICAgICAgIC5yZWxlYXNlICAgICAgICA9IGNz
X2NoYXJfcmVsZWFzZSwKPiAgICAgICAgIC5mYXN5bmMgICAgICAgICA9IGNzX2NoYXJfZmFzeW5j
LAo+Cj4gLS0KPiAyLjU1LjAKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9rdm0tcmlzY3YK
