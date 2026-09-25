Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F68C98326
	for <kvm-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 07:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r0nPLbrthrnzJvbFal+W36WCtTp4PC4Q1OgumjMNK7M=; b=OrVe1EeXVRm3xj
	HMeGm4TFmUafR29H2FdH61pBFFZ7G4dEb+CURcedJfcRhjM3jpTPlHNg/U1g8tYNs60vWUkfZaj+A
	VA1j9U3z1vrOSdlgurH4G1BOUjcavj1g5lReIzft7rgHstK4CyefEAjOC8Nc8PDy653zfP7NSBahQ
	d6RxshV+QoCzFgnnNVOYQArHe1JFg/GPq9nPTLrgYcK8pxU8ToTzAN6tamqghCnn3vRSkW67XRSpT
	gkPyehOfFAkWiVzbmFeQ193EOVCg+rhrmc1vuLr11oE07v/IatEua7g8gFOD8rD+i/4RyWeMewF97
	YuQKLc+DbGOZbeiAkTow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0TI-0000000Comd-0uoy;
	Fri, 25 Sep 2026 07:35:52 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0TF-0000000ColM-09FX
	for kvm-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 07:35:51 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6a5f9b036f9so5426a12.1
        for <kvm-riscv@lists.infradead.org>; Fri, 25 Sep 2026 00:35:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790321747; cv=none;
        d=google.com; s=arc-20260327;
        b=W4RVKMmoW5Q/1lLDnNvABMlQYergHGbQNjkFtP1Ctp9m2Ap/tXM4g6GqPw/8uH9Qpd
         isqM/809Ylvof1k2LAVO5FYQWd58CvaYmF+gS25TDh9YXL08OAsA6d4edDisInEihwMr
         rHHpKGYVIO8SMg6CKt8r9FJ5eofw9p828pC5c+thoC9GEzYbvJa9Opopz9FLmhSid5/W
         WfMu6QNMVq6/03yBQsoijoCnrKdpll1FRt7W/qwSNTtHyFRzUcVROLevxYsJr7mbXpZU
         PhuwwN5ywf5OICVxsOQqsg6Hzy6GI8N7ukJli5Qp1s+NeMAYSyFAqLFMrrfO0EkWFk/V
         ib0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TiarA2FI5/GYv9nr9lV3Ck7oSnVRWS2NuO02/gM+R5Q=;
        fh=jcpZ88ACez/HN5aL1U7vE2E50adkFVJqsBXQC2CKjtY=;
        b=Q0J7q0YNRjoYo1+jIDpicAROIb3okZXVAN8GuABmORlFZpeZEQ5BO+UPhTfiSBeDn9
         ju1zEUX9i95K+MocCtdRIfga93hjEAvynIbSUUyiumaFnZaXBboBNbDKd9a+iHNb457Z
         UpvXk6PHRwZqKerWvktgKeNmqcJh1mY16A8QH6jhE+9vky507vu8xS4y30u5JMbf526/
         terTanjB+Li2i/pL7lZ/d+RuAIV1ZVx81+DfYRAxr5sZDK+0usWc3PbZGN3qqCSSpDz1
         Xz4Ylz7YRKWIqUgVMN79D1+StWxJTfn/2ZDEi6WS5WImjv3PHCHhu2xaFMdyhGvbkXow
         cGZg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790321747; x=1790926547; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TiarA2FI5/GYv9nr9lV3Ck7oSnVRWS2NuO02/gM+R5Q=;
        b=e2tScsc+xfvGCacmq2oAOi0XvvXyZlQsGt0HdVlrBQ+CuH+1DUdKcp18nw7hNdBK0N
         JleYv57wXXWiJ4Bq+MBhYITv6B/fhm7B9avk9MX8+FJQPePv+2gh0ANTGxeg/OgSZEsU
         LEjH7DV7rxdG4TX/Sw+BFvH1NMevA1Brgl0An7CaWHFQobjdJ1yKCQwmd4ga+gxTOxEB
         uFER77vtuznXX+d/637c9e/BxCk5pOX1SbMolcAZDB36VjZ8AQClMhFUEG8bZLarB4R5
         YR5K/RWkEdzf+VVdlEnzHEWpiuZlkI1Wn4jGSSijSWmGwkD7hfUeWrn0N1qIpzV9p78m
         7kbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790321747; x=1790926547;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TiarA2FI5/GYv9nr9lV3Ck7oSnVRWS2NuO02/gM+R5Q=;
        b=hokCCs/n0GD0SzSv2i6/UmrzLdf3lvft3G/aieSanVujyIPwtRKGP7JpyWkijeVcrx
         us3wAjZkF4VoVE1cp99IMALtTnQej2KJSDPLxW09B8XzmcaSiz7SpnbNHaO3JfOFlWrU
         kmWTT0WTBtlUT/8TKvm7T51ABqZN7EWrjuEzPq6wf7Odfjd9AW+zXqzTjavxvvDL/G2P
         6H7UMhHMQg8jsh3jraFRDn7CEYmRUYzvebAnOS2Z5EeY4EWex42Z2hupUviK+hz8rz9s
         FxBNmcxDEUgG+PsgqVnpfiZ9nO5eRHM1Qa6S6Cw/+OeT6FgGt1SftI3K3ywf3GEZUqjj
         6Tsw==
X-Forwarded-Encrypted: i=1; AKwUvBzsYIYFS2lhWeEI4L2LYKGxBNh6qU9NbQp+TiiaCq19HAG72IIpkf8KKxfUVI2wgd4Y0ryb0XLuPPA=@lists.infradead.org
X-Gm-Message-State: AFuF++n6JZzbN2EY1G5mIn92CMkXIhxWk+vBHGIcu2kf8m3KbPx+Fmwo
	nauZXMkItr5paRFXdy+KWYOsZKOd439Zs7zyeeWWDT7ZNSIjqGjzv9EfRfwLvs8Y6nPVZUvUnk7
	GfN7Znb+ShPe0SyanR5jwIFqhBkipdky796H5oz17
X-Gm-Gg: AYBFou0E/td3dIyFMc9sXmqXlwwZDivmYJLFR52ckK6iY9emM5qHei7ISBUQOCFohMC
	fKdk38/1bADk2WSETAZ3uIIaUz2By4Ju/zj0s0bL5A4xSLbpfpWNMg1qovp/sKj77tRXLjwaX9e
	So5F+qGzve2nOkRH++Gj3luh8t1oHmlxpioQDT7+k8CQSVGWIPd1TIqJSanb3FVpl1LeJCPE1SH
	sPQyri7z9Ps+nnHNrW3wKYn5lwitxxz6rl+U19VtmkMPT7S6NCsi8qug8VQbWk2/FnrRhGl967E
	+POCHRKQXnBl8E99YhQJ5UdCYjJdDp1SwbNFs9c/0phg+Wp+cxNTdWBq768exTgO
X-Received: by 2002:aa7:c64c:0:b0:6aa:e332:b762 with SMTP id
 4fb4d7f45d1cf-6aae49c58f0mr23500a12.8.1790321746110; Fri, 25 Sep 2026
 00:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-6-4583d8a23bca@kernel.org> <DLNSNQP7L4FM.1JZQ0GS9300H9@nvidia.com>
In-Reply-To: <DLNSNQP7L4FM.1JZQ0GS9300H9@nvidia.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 25 Sep 2026 00:35:33 -0700
X-Gm-Features: AclHuK_NuiQlFRW78Nf23QbG4E3oej6nx-ZjiAb0IRRSHloLT2xGmv-6NXWsN8E
Message-ID: <CAJuCfpHpo58c6eOPY_CvP+ts2zwXQEDNX2bohXd0CBANYWrBWQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/40] mm: make map_kernel_pages_[prepare,complete]
 internal and unexported
To: Zi Yan <ziy@nvidia.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_003549_107805_B7114002 
X-CRM114-Status: GOOD (  19.21  )
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

T24gVGh1LCBTZXAgMjQsIDIwMjYgYXQgMTI6MzDigK9QTSBaaSBZYW4gPHppeUBudmlkaWEuY29t
PiB3cm90ZToKPgo+IE9uIFRodSBTZXAgMTcsIDIwMjYgYXQgMTI6MjIgUE0gRURULCBMb3Jlbnpv
IFN0b2FrZXMgKEFSTSkgd3JvdGU6Cj4gPiBUaGVyZSdzIG5vIHJlYXNvbiB0byBleHBvcnQgdGhl
IHN5bWJvbHMgZm9yIHRoZXNlIGZ1bmN0aW9ucyB3aGljaCBhcmUgb25seQo+ID4gY2FsbGVkIGZy
b20gaW50ZXJuYWwgbW0gbG9naWMsIGFkZGl0aW9uYWxseSB0aGVyZSdzIG5vIHJlYXNvbiBmb3Ig
dGhlbSB0bwo+ID4gYmUgZGVjbGFyZWQgaW4gbW0uaC4KPiA+Cj4gPiBUaGlzIHBhdGNoIHRoZXJl
Zm9yZSByZW1vdmVzIHRoZSBleHBvcnRzIGFuZCBtb3ZlcyB0aGUgZGVjbGFyYXRpb25zIHRvCj4g
PiBtbS9pbnRlcm5hbC5oLgo+ID4KPiA+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IExvcmVuem8gU3RvYWtlcyAoQVJNKSA8bGpzQGtlcm5lbC5v
cmc+Cj4gPiAtLS0KPiA+ICBpbmNsdWRlL2xpbnV4L21tLmggfCAzIC0tLQo+ID4gIG1tL2ludGVy
bmFsLmggICAgICB8IDMgKysrCj4gPiAgbW0vbWVtb3J5LmMgICAgICAgIHwgMiAtLQo+ID4gIDMg
ZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+ID4KPgo+IE1h
a3NlIHNlbnNlLgo+Cj4gUmV2aWV3ZWQtYnk6IFppIFlhbiA8eml5QG52aWRpYS5jb20+CgpSZXZp
ZXdlZC1ieTogU3VyZW4gQmFnaGRhc2FyeWFuIDxzdXJlbmJAZ29vZ2xlLmNvbT4KCj4KPiAtLQo+
IEJlc3QgUmVnYXJkcywKPiBZYW4sIFppCj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2
bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
