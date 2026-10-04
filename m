Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA733CA5FF5
	for <kvm-riscv@archiver.kernel.org>; Sun,  4 Oct 2026 17:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SkGa5wkf9Nji6uC3nvQbtqRfJO9tOkAzwemrkWDvwJY=; b=ucy0+WOmVwjAnt
	QUaCh0O1KW1Ht+ynCw0l9vn3e33IAyag0pRI6uB4ow4IHitusRpKq0nCJCt60d0wpVlcplfJRdt8V
	VcAg+2jiTbDRklXn/oBHkTxvb32OwKmFiZteWycfbdNEkHS9ZiwgTVRKRkYtQ2PAXLOeIQTEdLBhI
	IvQDCF97ccyN4yZQIC78c6Zf4LY8Yn0i0wQoW/us5A87wqUmu4mkPEFYOF4otwFSk1DeggbTMN3E6
	6ltdFwAspC7njDCOwu/Xoyx0HaXhP+03Zkc6Tyov6StFJ2bY+bIg5dh5MnyNC1kBAV/bEbbeQC0UL
	Phv6fIi291+0B3WgTQWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPry-0000000F6Wu-1gjS;
	Sun, 04 Oct 2026 17:19:26 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPrv-0000000F6Vl-2Cs7
	for kvm-riscv@lists.infradead.org;
	Sun, 04 Oct 2026 17:19:24 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-5337fa12431so180711cf.1
        for <kvm-riscv@lists.infradead.org>; Sun, 04 Oct 2026 10:19:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791134362; cv=none;
        d=google.com; s=arc-20260327;
        b=lozvs6AtmY2AjUo8UGjImnuCJMXexCKuU0vtq1LYGEMTu7+OTwEKUU1TJmAxo7+pUu
         pSQGOWF7nVNvyJgGMU9ae2Rr3x29y+xWSoW4mji76quHHfbYTDbBIRHWKLaROdavIyNr
         +xqCgUsbdXngqfpYRtqEfZHLaZRbL3ESqWitYRrebG7trirgQfn0PIDTygLEU9HTRVXe
         pHGonLN7yaoWOm0Q6FUZ+4tk+nOg+dlNGwqZBIyjaayFEEYuYXCDx2jWL3pJa/InGmqI
         yWqB6Eh1Hit+UOg7vrcLIcLvl8Z26zK4j9YjSxnNdTQeV3DSCXGYFXwjoAY6POvdopz8
         /Txw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LB9YQVahVaEWF6zZVDiq8xpdl9rxBex8+tzU6TEVUNY=;
        fh=7V+pT0oaTok7mh/mtM9pEK9Q1BnnEibqgj8N7/328UA=;
        b=WNOejjlr+Ls1DAozTRrrEHf6ywiajZSeVYJq32XRDl0fxEagtV8aisEY8f2XJU11Ru
         gF0egaA2WdASkh6Oq94ZIGMlBEYo4NEqnj5bZBCo0hM4T5+10mG+OecfM7vWsVWIr+8e
         oPuUxd4/MHHRyzmMXPRlBMKx71Q1BBgYi2aqdRfq09EveKqBJ4XFzVcKCtHZgTyxwema
         iwY6TrA2kbTajf7pPQg873eVEJLYPh+mEfX2XpwTEkVho5Xe3l1vs+xJqQsie90kEC2G
         qHAW4ht3vVN3ZnUM64d+SvxGrgdv9DbQA4U+T3xZoaz21UDi1HeUaazh+ke2XMXuoy0A
         14tA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791134362; x=1791739162; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LB9YQVahVaEWF6zZVDiq8xpdl9rxBex8+tzU6TEVUNY=;
        b=hDpWHWxbSC0CWTpLWRjyzjuHp9OmvjPPjzY/E4SHCnS9B/Wof4OXlditxkBznv+ftc
         gW5huvE8bw54l/AhdkkCRwew28YO1GrltLhoa6WewqG626zbK9h5BoDOUycX5xxEF6HJ
         UKSLtIAZW+AvVWUXFi8JKg9cDKbqjV5dP1cLtbdRYel6Fj2yM1KCdTwPNJoNafHq9bnX
         LE+sdQIwNiC4Swqp6kbVIMdXMNZ0w5N+wu+75CwMYS3roCnCJ0H+hv6S/GfnKbPBhRrT
         Z3fculyqB/AC45WHs+TE3FhwLIaFrh8Yhaj6Y5V+GEvNCrO/NduOdAo1nh3iodV3p7ha
         u3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134362; x=1791739162;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LB9YQVahVaEWF6zZVDiq8xpdl9rxBex8+tzU6TEVUNY=;
        b=j1K8rW/NqTOGXNbwWYMYlG2Euj+Hj2CCYK4Ehk1scWTl5KELPCbhkVT+92fwjBZcCx
         UxMIbqHFcyJCnDugxhPUFtsj/w7u+x5cH+MilB7aF4G5htow/Zey3zTObOCkxmKwRz/a
         lNbAS9jHMBYDwmgtHIl4D9i4APvRi4wkKx46USLWyA8bpWXe5/r/Np882q+1hCezeS6/
         Qoup3euIAZxvBI5ez/TyOhPJMNMDmCSkGxPQXxRNXsiu8vsNxlAgW+FKaPBr1A0ih+j6
         NbPjZ6qQHs7JOvq6DxGYEdp9oQtlU/Bf3Aa6sZyOUNU+TYO9kp7tDGFrdO9RScUHKWqy
         6P2A==
X-Forwarded-Encrypted: i=1; AKwUvBzeECXR3G/HKGRwiBARyse9VUqPxyRR/EDJ/a2z8MgnbYh99lZADyvZzrSOdH3V3mW0yUROLFu1lHQ=@lists.infradead.org
X-Gm-Message-State: AFuF++lcqzfbByW70UoIW+0vjwXynXA29Delxk9kUo4eYexnHmyk6rVV
	fCfon39N9SBvVdYDcM6qRWMBD1gxL3P8mvurmhYmsH+lL8su3BWp7elKoQ/cjhCp7sNzq8kQznN
	tq5HlsJDfXN2yDMROn//rxtttSJC60j0dEj+bUC/z
X-Gm-Gg: AYBFou1x9RrmMRePES3A2pPeCntHb+gbw597yJmM8EEzaPB8TF9o4SicA2zUmHngHma
	LJwyRwPpIWIXC3X8lk5EPH4Ex98jcrP3Dco3MyPGh/3dk4ybeQ271G92K6EQhBBaoPZTz1L/H5R
	EWseLB/SHrAWUJFo7RzMjqzy5iBiVLaSzjMoNRKmweZm1KWn/Flr+81IvIfOMF6SLg0QcDmhvZ1
	+QZdW03GOkF5WvHfnFdgSkxKYKreqYj0ajHcvR8jrbRvC96xy+GWhdv5nYc3xYs874NtojS/FfY
	QEvgfXO+l22Sk5RQkohSaaeZmbqLuODcq4UHwRfchDLOitVdGZO18Cz+mg==
X-Received: by 2002:ac8:5e4d:0:b0:532:8423:1e78 with SMTP id
 d75a77b69052e-535131e75aemr16242571cf.10.1791134361196; Sun, 04 Oct 2026
 10:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-0-a1f052500fd7@kernel.org>
 <20261003-b4-mmap-prepare-vma-flag-sanify-v4-11-a1f052500fd7@kernel.org>
In-Reply-To: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-11-a1f052500fd7@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 4 Oct 2026 10:19:09 -0700
X-Gm-Features: AclHuK8q5domRMZg3DAHzMyB2slG297Lp1_L7hWmlqEUWco5tu_MI_s_DzFbhWI
Message-ID: <CAJuCfpGdJM=J+6tkzid_Mu+7nevdhFaTW0E9tbKXoLmzC951Fw@mail.gmail.com>
Subject: Re: [PATCH v4 11/38] selinux: reject writable opens of policy file,
 drop mmap shared/write check
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_101923_602879_146833C6 
X-CRM114-Status: GOOD (  24.06  )
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

T24gU2F0LCBPY3QgMywgMjAyNiBhdCA2OjM34oCvUE0gTG9yZW56byBTdG9ha2VzIChBUk0pIDxs
anNAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBUaGUgcG9saWN5IGZpbGUgaGFzIG5vIHdyaXRlIG1l
dGhvZCBhbmQgaXMgZXhwb3NlZCByZWFkLW9ubHkgKFNfSVJVR08gaW4KPiBzZWxpbnV4X2ZpbGVz
W10pLCB5ZXQgc2VsX29wZW5fcG9saWN5KCkgcGVyZm9ybXMgbm8gb3BlbiBtb2RlIGNoZWNrLCBz
byBhCj4gQ0FQX0RBQ19PVkVSUklERSBjYWxsZXIgY2FuIG9wZW4gaXQgT19SRFdSLiBSZWplY3Qg
Rk1PREVfV1JJVEUgYXQgb3BlbiwgYXMKPiBrZXJuZnMgZG9lcy4KPgo+IFRoZSBmaWxlIGNhbiB0
aGVuIG5ldmVyIGJlIG1hcHBlZCB3aXRoIEZNT0RFX1dSSVRFLCBzbyBkb19tbWFwKCkgYWx3YXlz
Cj4gY2xlYXJzIFZNX01BWVdSSVRFIGFuZCBWTV9TSEFSRUQgZm9yIE1BUF9TSEFSRUQgbWFwcGlu
Z3MgYW5kIHRoZSBWTV9TSEFSRUQKPiBjaGVjayBpbiBzZWxfbW1hcF9wb2xpY3koKSBjYW5ub3Qg
YmUgcmVhY2hlZC4gUmVtb3ZlIGl0Lgo+Cj4gVGhpcyBhbHNvIHN0b3BzIHNlbF9tbWFwX3BvbGlj
eSgpIGNsZWFyaW5nIFZNX01BWVdSSVRFIG9uIGEgbWFwcGluZyB0aGF0IGlzCj4gbmVpdGhlciBh
IFBGTiBtYXAgbm9yIGEgbWl4ZWQgbWFwLCBhaGVhZCBvZiB0aGUgY29yZSBlbmZvcmNpbmcgdGhh
dCBvbmx5Cj4gc3VjaCBtYXBwaW5ncyBtYXkgZG8gc28uCj4KPiBBY2tlZC1ieTogU3RlcGhlbiBT
bWFsbGV5IDxzdGVwaGVuLnNtYWxsZXkud29ya0BnbWFpbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEph
bm4gSG9ybiA8amFubmhAZ29vZ2xlLmNvbT4KPiBBY2tlZC1ieTogUGF1bCBNb29yZSA8cGF1bEBw
YXVsLW1vb3JlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBMb3JlbnpvIFN0b2FrZXMgKEFSTSkgPGxq
c0BrZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6IFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdv
b2dsZS5jb20+CgoKPiAtLS0KPiAgc2VjdXJpdHkvc2VsaW51eC9zZWxpbnV4ZnMuYyB8IDExICsr
Ky0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvc2VjdXJpdHkvc2VsaW51eC9zZWxpbnV4ZnMuYyBiL3NlY3Vy
aXR5L3NlbGludXgvc2VsaW51eGZzLmMKPiBpbmRleCBjN2Q5MTQ3Njk3MWMuLjU0NWE2Zjg5Zjll
NyAxMDA2NDQKPiAtLS0gYS9zZWN1cml0eS9zZWxpbnV4L3NlbGludXhmcy5jCj4gKysrIGIvc2Vj
dXJpdHkvc2VsaW51eC9zZWxpbnV4ZnMuYwo+IEBAIC0zNDAsNiArMzQwLDkgQEAgc3RhdGljIGlu
dCBzZWxfb3Blbl9wb2xpY3koc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpbGUgKmZpbHAp
Cj4gICAgICAgICBzdHJ1Y3QgcG9saWN5X2xvYWRfbWVtb3J5ICpwbG0gPSBOVUxMOwo+ICAgICAg
ICAgaW50IHJjOwo+Cj4gKyAgICAgICBpZiAoZmlscC0+Zl9tb2RlICYgRk1PREVfV1JJVEUpCj4g
KyAgICAgICAgICAgICAgIHJldHVybiAtRUFDQ0VTOwo+ICsKPiAgICAgICAgIHJjID0gYXZjX2hh
c19wZXJtKGN1cnJlbnRfc2lkKCksIFNFQ0lOSVRTSURfU0VDVVJJVFksCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICBTRUNDTEFTU19TRUNVUklUWSwgU0VDVVJJVFlfX1JFQURfUE9MSUNZLCBO
VUxMKTsKPiAgICAgICAgIGlmIChyYykKPiBAQCAtNDI0LDE0ICs0MjcsNiBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0IHNlbF9tbWFwX3BvbGljeV9vcHMgPSB7Cj4K
PiAgc3RhdGljIGludCBzZWxfbW1hcF9wb2xpY3koc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCB2
bV9hcmVhX3N0cnVjdCAqdm1hKQo+ICB7Cj4gLSAgICAgICBpZiAodm1hLT52bV9mbGFncyAmIFZN
X1NIQVJFRCkgewo+IC0gICAgICAgICAgICAgICAvKiBkbyBub3QgYWxsb3cgbXByb3RlY3QgdG8g
bWFrZSBtYXBwaW5nIHdyaXRhYmxlICovCj4gLSAgICAgICAgICAgICAgIHZtX2ZsYWdzX2NsZWFy
KHZtYSwgVk1fTUFZV1JJVEUpOwo+IC0KPiAtICAgICAgICAgICAgICAgaWYgKHZtYS0+dm1fZmxh
Z3MgJiBWTV9XUklURSkKPiAtICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVBQ0NFUzsK
PiAtICAgICAgIH0KPiAtCj4gICAgICAgICB2bV9mbGFnc19zZXQodm1hLCBWTV9ET05URVhQQU5E
IHwgVk1fRE9OVERVTVApOwo+ICAgICAgICAgdm1hLT52bV9vcHMgPSAmc2VsX21tYXBfcG9saWN5
X29wczsKPgo+Cj4gLS0KPiAyLjU1LjAKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3Zt
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
