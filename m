Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D320DC98304
	for <kvm-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 14:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GyfcVs5m0ANqx/P51Metp8432ZEN1YeQHz/sPmbvATY=; b=QB9B5aykhuHZHD
	MRakSBJCwrMfbrVdLH+qU/KjMDgU0nJbMUW8VUymnIA+CSVgfFQAo+O9yZkTrlc+97fGqdKxLqB1k
	kLe1TvIpdT9ZYBO3Br6Nq8oVDkvSYgQIsQc/D/zNbHhUCZip+jPsCr/tgB0Ic2MtLi5qSmcPHnk8m
	v4j0cJuAd2y+dJdrNvn8MxucuKztvW3G/otsOKyL1/WgQlGoZOXCv7KLuOF4eSzgIowXWpxwloGm1
	vfc85Ov3Fb3lWFdnQm04XfQNk3/9hhJxfUDwA6JR/T+TbXqAKu6tIrBEfpMQ2NY8XXkpduU01wke4
	P2xHVv4NMQpSlAtrfYwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9O0K-00000008XIE-1RwI;
	Wed, 23 Sep 2026 14:31:24 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9O0E-00000008XGe-3cGU
	for kvm-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 14:31:22 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-532e9ad9a1eso208311cf.0
        for <kvm-riscv@lists.infradead.org>; Wed, 23 Sep 2026 07:31:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790173876; cv=none;
        d=google.com; s=arc-20260327;
        b=ViB2VrDE+JupGNhcCrQXFidnV7Rb71Sf3xVIrau0fiGjwOn/gWEW+YqHa6R1/scuup
         tBvCleQTxobpR/3qVn4e8SM6cy9YcoFOUAkwxEWjBG9RPviUSnyz6aikYW9O5g4wokiE
         gDUosLY5ACQAcSXrkD0xZ+AU89lKzEi/diL28ZlvDGlDnEw0zGNf62Kqiq54KfH3Q+pP
         jNm6x+D//4zMIrownfPEfWxjj5sQ6HUVAzgAuWSOZmq3UBtTVja4kCq0s+zTBbincDvS
         v+ogaL9LF5FAI+uG0hlsWnfLTfQO+GoyJqTtDkZoscZWuYDk/IR70S/wb+2tAjIAtkl7
         JF0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3IRQTfCkVu29EAhzhIq8HL8xV9bhN+vmwTvfaTzW1hg=;
        fh=pn/4/guXD1poACuZQpbk93uzMyrkVB12Hjb586vh114=;
        b=QBdF8VW2Y9Blhu+NcK/CJNXHe3Ez1m6Wr+68KOiv5ZEgsJ38q5tDzUZGuJQNBfuxEm
         aNR6bfOLCSEv/du4NAbavWIwdpalGI1BY3TzaR0b82O4JV6zL3KLXWgnGd3Yix9qYrFQ
         XWi0g+RBvC2RwTUH1Dr0amcZVC+VH3y3GXyNXp2xNljmed0v+pI+oZhJmpLkU31Pj66O
         MEUSaAUX6GCDmIkENBZLKfIr9WIBU6ia87HXlfBCV9C1srHxI9NXv4SxJmiCgVUaI+Zn
         dnq/ehSBT0BFLx6Waj3Hji9K6MtMGI/61dtprxSgtH2DYZG4O4kG1Qq5MAXDM6Wn8U94
         GNFg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790173876; x=1790778676; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3IRQTfCkVu29EAhzhIq8HL8xV9bhN+vmwTvfaTzW1hg=;
        b=HC0N1IuyPA8DrgPgWVM085ZGsjm9XpEIwaLiRt3QXfC513shUkcvZpKP+wnYXObQf1
         9FyTlFdBcAciBzL3X853O2JmyxjEBGr+Yyf4AZHRDWZ4tGRI0v+1VIS210m4aSP2lYjQ
         uE1yZSIOr/HXe5kWszka8YZVQ3yDY+a/omz03pFwaTUcZxZdIqCduUf6CBkCaUPBuuIj
         Z5tKX7ItdjJALztsJa8jerWkdqQ1hlpFEynTuR46zG7T8evk6aAtbjuVVjWoFNJ47GaN
         qRyFYIH8EpGL5+Gqlie/d5R4InhFJm5CY5v5rP4pWiirZuhbpORxeaAiUoGgio193g43
         CkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790173876; x=1790778676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3IRQTfCkVu29EAhzhIq8HL8xV9bhN+vmwTvfaTzW1hg=;
        b=RCpQh4mFyaU7/7Xg+sqPLA/m676Q0Mvtg2hBhG1yiMzC9JLwu28SSvv1WwZ6NOdwbf
         VnPRG7/0w/d/GgWhNM22NYU/85m/vY2++vYbYxSrktkwAhrGs8nO9vrp8lib1qi8zDQS
         AAKlaJrkLX2xia2UGLaUBj0c5wixyCi5OEuw8hwfjvpf0MXjnV70rh8WxfD0WkfE1J0a
         0KRu987rRmPxbT1s5ag8RJ1yvC2iUTtI75QktbNEV5UDr0Q7aOrMFR/RbceFCMjPeOPQ
         22ALyDfqQqxXqo8b5EKfXUaeEsAmfpFq6IYLfOiYy+IH9CKMEG5BVRt4ZzUWpAcovTs4
         hpgA==
X-Forwarded-Encrypted: i=1; AKwUvBwYHWe8+fWh5q613xOR+D4hZx1dIeZDPwgkkaj4b/IwqFFOaN4fkd9y8Wn4/fCpApHPQQx4RNqbFoQ=@lists.infradead.org
X-Gm-Message-State: AFuF++lZ3lOsyy+VL8LQEfC8nxgp3f0SY7xdwFHMjgmlnNg05b2DO4cr
	7KYlGsIGDnTCktrtE97QvBVq1v8PFHW1IC4koCU+/na8EDr1fi/l+6MEyySPUwOvK3nydVUCHi2
	5a/N5QSikeYxWxo7tuygsksgg88J+bp2KNiwASVuE
X-Gm-Gg: AYBFou1mhchq7r7AtmvnVHxwx16A1AD7OD3TsJL8T/8XaaqoHSaStySDBY1iXhuqAcW
	uSk/PqgBhcmqn+AoIb2em9J85L1qaloKTbusTW3HE0S7fq+P/OWg5lQt5XdTD16vzpef/CdTHTl
	x5BT0Em70vn4eJzeQldWncpnKkq+OLB7n1a7QfMu2tkzJvz3UmHjul8hDkW8kLAeF9IgW+WL177
	CEoHbXMsUxdl7HwOA5bn+/Kka/Vnf09CuXtP/F1IMhnR6mG2YZPLcaJhGb05xyEjtAhBgBtZmYn
	CKQzpwUrWBn9GHQDGVynZbs3pNkUtzzVV5WxdX3rxfIuqJw/rjLL60HlPhIJchdiNNFKKVFBUx1
	XCSLwoU2BPg==
X-Received: by 2002:a05:622a:260e:b0:532:9d15:2e5a with SMTP id
 d75a77b69052e-532ede89b29mr14598791cf.1.1790173874906; Wed, 23 Sep 2026
 07:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-b4-mmap-prepare-vma-flag-sanify-v2-0-7d9781ed5361@kernel.org>
 <20260914180811.057cba8fcc48d6e0b53a2683@linux-foundation.org>
 <0b064fe6-ddb3-4f26-a1f2-2e9dd88d590f@kernel.org> <CAJuCfpFBichJH4OcmSHTb1rOuQBT6k5pXeua9_KgpWjDBKvsYw@mail.gmail.com>
 <aq6kzpK7wPl3iFGe@gremlin> <aq6lW9FvL69QeA9H@gremlin> <arOCPN02xB7mykju@gremlin>
 <b007cd0f-29ef-457a-8e44-63ab26f3bcd0@kernel.org>
In-Reply-To: <b007cd0f-29ef-457a-8e44-63ab26f3bcd0@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 23 Sep 2026 07:31:02 -0700
X-Gm-Features: AclHuK_ZGTwaB8ygIyiOyIIeQNRzbEtns-G_Cds8CuZ4q61CHw7YMjTifucik0o
Message-ID: <CAJuCfpHL=dHjT=O4S88ZBvT1DyodAtCL9QTryepzs3EMwoECDQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/40] mm: make VMA flag semantics explicit, eliminate VM_SPECIAL
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev, Takashi Iwai <tiwai@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_073118_923713_F7A1332B 
X-CRM114-Status: GOOD (  22.18  )
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

T24gV2VkLCBTZXAgMjMsIDIwMjYgYXQgMTo0MOKAr0FNIERhdmlkIEhpbGRlbmJyYW5kIChBcm0p
CjxkYXZpZEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIDkvMjMvMjYgMTA6MTMsIExvcmVuem8g
U3RvYWtlcyAoQVJNKSB3cm90ZToKPiA+IE9uIFNhdCwgU2VwIDE5LCAyMDI2IGF0IDA0OjA5OjEz
UE0gKzAxMDAsIExvcmVuem8gU3RvYWtlcyAoQVJNKSB3cm90ZToKPiA+PiBPbiBTYXQsIFNlcCAx
OSwgMjAyNiBhdCAwNDowNTo1N1BNICswMTAwLCBMb3JlbnpvIFN0b2FrZXMgKEFSTSkgd3JvdGU6
Cj4gPj4+Cj4gPj4+IFRoYW5rcyBndXlzIQo+ID4+Cj4gPj4gTm90ZSB2MyBoYXMgYmVlbiBwb3N0
ZWQgdG8gZml4IGEgc3R1cGlkIGJ1ZyBpbiAxLzQwICsgYXR0YWNrIHNvbWUgdmVyeSB0cml2aWFs
Cj4gPj4gc2FzaGlrbyBzdHVmZgo+ID4+Cj4gPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgtbW0vMjAyNjA5MTctYjQtbW1hcC1wcmVwYXJlLXZtYS1mbGFnLXNhbmlmeS12My0wLTQ1ODNk
OGEyM2JjYUBrZXJuZWwub3JnLwo+ID4KPiA+IEp1c3QgYSBnZW50bGUgbnVkZ2Ugb24gdGhpcyA6
KQo+ID4KPiA+IElmIHlvdSBndXlzIG9yIGFueWJvZHkgZWxzZSBoYXMgc29tZSB0aW1lIGl0J2Qg
YmUgYXBwcmVjaWF0ZWQhIChvYnYuIHRoZSB2MyBhcwo+ID4gbGlua2VkIGFib3ZlIG5vdCB0aGlz
IHYyISkKPiA+Cj4gPiBJIGtub3cgdGhlIHNlcmllcyBzZWVtcyBpbnRpbWlkYXRpbmcgYnV0IG1v
c3Qgb2YgdGhlIGNvbW1pdHMgYXJlIHZlcnkgc21hbGwgYW5kCj4gPiBpdCdzIGJlZW4gaW4gLW5l
eHQgZm9yIGEgd2hpbGUuCj4KPiBCdXN5IHdpdGggdG9vIG1hbnkgb3RoZXIgdGhpbmdzIHNvcnJ5
LiBJdHMgdGltZSB3aWxsIGNvbWUuCgpIYWQgdG8gdGFrZSBjYXJlIG9mIHRoZSBwaWxlIG9mIGJ1
Z3MgYnV0IEknbSBvbiBpdCBub3cuCgo+Cj4gLS0KPiBDaGVlcnMsCj4KPiBEYXZpZAoKLS0gCmt2
bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
