Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C57C55ABF
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 11:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HgCvXriN2KbQ1U0kpoz9xQXQYbZmD6lnh40XvSftncM=; b=kEkLR7663HyBO9
	wl9uP12cv+uAk2754FV8/46ZQwozMWCzTPeOelW/EjLiJsTP8Buaf/+dPD4OAfKxGRCddUF3BQM/f
	+oRDWioPDcVHJzyvWSDHm/hdL0a3bWR1cbpa3QKvWOeNAfMznj7GEd4VqjEjozQ8mJUV0DCmkJQhw
	bxcCGoL4U76vQYAPfe21Qb8YA+senbQdoR9cT91Po47xiKWp80aG7EoL7Zcd50j7Il2S8Us/sCKHz
	8EN66SjXXpnf1eAM5/s/8sWCxQjOAeQc7v/NnBJIka6qEtgswEKR2K23W4lOu+tzjIOjOn01EZK+0
	Rpv0xZPCoM7jbU7ieIKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvtD-00000005bx3-08Zr;
	Thu, 06 Aug 2026 11:03:55 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvt9-00000005bvJ-0pmZ
	for kvm-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 11:03:53 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-6acc88b9c5fso1062649eaf.2
        for <kvm-riscv@lists.infradead.org>; Thu, 06 Aug 2026 04:03:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786014227; cv=none;
        d=google.com; s=arc-20260327;
        b=rvrFP/xX8UHZoVo/41wyErYYOSkZ9d3VlzKaRS1GCmun9+zg5FVfW70BBmMPZdDjG0
         m1bz33FNP/At86+gQyYN+v6tQ9TSEaPkD8DPao1naXkw3QJjyM2+i2/BdGlEBA7O1cSs
         ks0R50ItAZahcLB48cOuPzxvIgO2yOKCxqk6/6EH+bQeZIUa+jX9p6z9GMC6CkaCZX8I
         bPylLTsGzQIBp4E9Oc75IOc5voyUYwnaqyFwITHRqdTp4sSw+8datE8+Kg7mX+UY94z0
         kFPVyJuO5MJcWykKqDpYe8c+2OkKFkjB2yYoB3LWgHBkzwIcWDAjPiTG0NwOTvFysXc7
         uQcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kMaEeVh+/U+NbRzoGC8Idgo7QP/ahOzSH8HwXGJHBcU=;
        fh=VQp153IlfIu8JboTane3zuDlgh1Uv/8twLbUahjrNNI=;
        b=TXuAdokOn4dsod9NKsQeiUxBKJcGJ4fQEBgN3kWIXSvErOE7kLxoK5YQ8ep+weKPiw
         RjfA+pjZJr4hQh2aPMUQvPt8Nf1BZy4uJrfebXqpvA1ylHury7i07H7nZkNik+BMfC06
         +8HstVbjIlRRQD84OqUlXaTAlYxvBgstGeSsSQBDJxdKV6z9PUl7ezIUf3G2widcCait
         nVs6a1KaCwteRYi+Z9/NlbDWFMKawgiBsnP99Lq8Vv0Z5j6GtvkgcqBQ0OjifoQeqdy6
         GwIe9aqCIzS2sVg4CRqwORps7jxWSyYIvtlCOREZ0xaUXaRflATADsugtoe6Ba0EJnwt
         0vZw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1786014227; x=1786619027; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kMaEeVh+/U+NbRzoGC8Idgo7QP/ahOzSH8HwXGJHBcU=;
        b=L2jaaWDTtlF7QNf82f6R+IbGOrkd7wQaQ7yTPAtPtz00Cp1pzOnrCdoXGgT36sZMRg
         U5HsD20+HN5dpLHba5chY1vwCn6ercPsuaZZbQslhHG0tTpFFPX1uuTbOlW6jm7BtrDo
         StGgKdKfSH4BV2Bg7F6jHggWX591/Bow9VJNMICxQeAKtV/mBM/wv4MAfSaSnetw+Kpm
         MBmOz5FivUSEuGt8mm9TF8AY5DNwStgIw8loYYdkO81/NA2jDX9M4NNziQ0Qf6V+7HyC
         J8Vg736iY+AaVRyjfgdcPRhYR1stYeCmGMkFjxq2aLJnjAWIMT9E7FF547q+x3GMoDLv
         wJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786014227; x=1786619027;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kMaEeVh+/U+NbRzoGC8Idgo7QP/ahOzSH8HwXGJHBcU=;
        b=hA98Vv26wNfCAIJN3GSc7jGRGzG8KViXaE6dbsVq9u3a8k6LCZvNbbagLZJnvcO0s7
         wCaaqAmpNKS0q2ivLrPjZPdphwH86MaAOOyc63RCHOPuqcf7WPTVvf145puRUxcDY/CE
         GG/63NDPzpMahBNUZCeo9DWyyNMTa8CgIZbC6rn+C5yTM1JOD66wnQZEnivznJIeHFMF
         wPx+BbOlkl4qdCcvU8RJVmgCKY5afSbkXR45TqYZklVflzKBqPd/XACRxs7/YusnlIHi
         OMS/AKUS2ZD/prjUg1wK+D+VMCEEvkDyc4gwe/WT7GMAH0+vDnnMHpnXeMfdfW1PFA5d
         r/Gg==
X-Forwarded-Encrypted: i=1; AHgh+RrDJiRBqtjiVTYrQYDRn1yel/qQPzQ0k4YfX2UEi+mbA6P9a9ORrQJPyNPqfcAiI7OVg6kd+pSej8o=@lists.infradead.org
X-Gm-Message-State: AOJu0YwKAiJIkvFvue0qWyGcaRJz6tA+GU/Z8bL0SnqybCWLZIvHEhGv
	kVBTe2VeXj97PRaW4quOc1VL7B1sFVwkJaUJriWsLuKkpdzbVBmwjoOPfJ77476kuncvw5R7I+6
	9v6eAs90MOuNGnc4O2xShFGROmJMpxQktT9+nOAQR+g==
X-Gm-Gg: AR+sD13fYai7GP3m0eBAl62f+LcorxbTEXHxM44jzYuvP5izFnSznQuDNf9BVpdB4h5
	0MVoU18fCpu1UO2Yy6h4loQD4sWAYOGesEW9Y5gOnp3q+dta6lkHiyhUKAMYgbiQdxCqxFcmmE4
	he8AGiQ5GsRq5fikpxV4mbKfKIM4VfSnrOSuIVCH1UbSVUzUrSQwfnFM8V1x6ksk0yrATXo1DoN
	wvA6igNwkEDKJ83Icc6z4oag8ckOt2hdsTB48guD2GyPUZHLhFPpf7Z9bFRV8Sduuf18mMWBvBH
	lQQG8q9BWzuJbsE4IcVLt3TjinQc/vTOwFSJz7An7P17Ek4=
X-Received: by 2002:a4a:e910:0:b0:6ac:ac32:b5ff with SMTP id
 006d021491bc7-6ae96c1b306mr7392747eaf.2.1786014225348; Thu, 06 Aug 2026
 04:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1784201104.git.cuiyunhui@bytedance.com> <138d74aa9863ae8ff445e16a2798d062895b75bc.1784201104.git.cuiyunhui@bytedance.com>
 <anQ2bW3JxraT6PFY@lucifer>
In-Reply-To: <anQ2bW3JxraT6PFY@lucifer>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 6 Aug 2026 19:03:33 +0800
X-Gm-Features: AUfX_myo8uemIR_J8tcaFPQk5bQ_19S-a0xl3xjkzuEjy5SWJNGo65WwssSv6nw
Message-ID: <CAEEQ3wk62WBSJb5JcnPJoVSb+JQq3ZcE4CRmqqTvkAO20XFjbg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 10/15] mm/gup: add fast-GUP specific
 lockless PTE helpers
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, kasan-dev@googlegroups.com, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_040351_249613_1632CBBA 
X-CRM114-Status: GOOD (  39.67  )
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

SGkgTG9yZW56bywKCk9uIFRodSwgQXVnIDYsIDIwMjYgYXQgMzozNeKAr1BNIExvcmVuem8gU3Rv
YWtlcyAoQVJNKSA8bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gK2NjIGxpdGVyYWxseSBldmVy
eWJvZHkgeW91IGZhaWxlZCB0byBjb250YWN0Li4uIQo+Cj4gV2h5IG9uIGVhcnRoIGFyZSB5b3Ug
ZG9pbmcgc2VuZGluZyBhIHNlcmllcyBsaWtlIHRoaXMgd2hpY2ggY2hhbmdlcyBjb3JlIG1tLAo+
IG5vbi1SRkMgYW5kIGF0IHYyIHRvIGJvb3QsIHdpdGhvdXQgYm90aGVyaW5nIHRvIENjIHJlbGV2
YW50IHBlb3BsZT8KPgo+IEkgYW0gYWxzbyB2ZXJ5IGNvbmZ1c2VkIGFzIHRvIHdoeSB5b3UgYXJl
IHNlbmRpbmcgYW4gb3N0ZW5zaWJsZSBSSVNDLVYgc2VyaWVzCj4gdGhlbiBjaGFuZ2luZyBob3cg
Y29yZSBtbSB3b3JrcyB0byBmaXQgaXQsIHRoYXQncyBub3QgaG93IHRoYXQgd29ya3MuCj4KPiBB
bmQgaWYgeW91J3JlIHNlZWtpbmcgdG8gY2hhbmdlIGNvcmUgbW0gc2VuZCBpdCBhcyBhbiBSRkMh
Cj4KPiBPbiBUaHUsIEp1bCAxNiwgMjAyNiBhdCAwODo0MTo0NVBNICswODAwLCBZdW5odWkgQ3Vp
IHdyb3RlOgo+ID4gZmFzdC1HVVAgc25hcHNob3RzIGEgUFRFIHdpdGhvdXQgaG9sZGluZyB0aGUg
UFRMLCBwaW5zIHRoZSBwYWdlLCBhbmQKPiA+IHRoZW4gcmV2YWxpZGF0ZXMgdGhhdCB0aGUgUFRF
IGRpZCBub3QgY2hhbmdlLiBLZWVwIGJvdGggcmVhZHMgdW5kZXIgdGhlCj4gPiBzYW1lIGxvY2ts
ZXNzIFBURSBzZW1hbnRpY3MgYnkgZGVmYXVsdGluZyB0aGUgZmFzdC1HVVAgcmV2YWxpZGF0aW9u
IHRvCj4gPiBwdGVwX2dldF9sb2NrbGVzcygpLgo+Cj4gV2h5Py4uLgoKVGhhbmtzIGZvciB0aGUg
cmV2aWV3LiBMZXQgbWUgZmlyc3QgZXhwbGFpbiB0aGUgbW90aXZhdGlvbiBiZWhpbmQgcGF0Y2gK
MTAvMTUsIGFuZCB0aGVuIGFkZHJlc3MgdGhlIFJGQy9DYyBhbmQgbmFtaW5nIGlzc3Vlcy4KClRo
ZSBnb2FsIG9mIHRoaXMgcGF0Y2hzZXQgaXMgdG8gbGV0IFJJU0MtViBTdm5hcG90IHByb3ZpZGUg
Y29udGlndW91cyBQVEUKc2VtYW50aWNzIHNpbWlsYXIgdG8gYXJtNjQgY29udHB0ZTogZ2VuZXJp
YyBNTSBzaG91bGQgc3RpbGwgc2VlIGEgbm9ybWFsCnBlci1wYWdlIFBURSB2aWV3LCB3aGlsZSBS
SVNDLVYgY2FuIGZvbGQgZWxpZ2libGUgUFRFIHJhbmdlcyBpbnRvIHRoZQpTdm5hcG90L05BUE9U
IGVuY29kaW5nIHVuZGVybmVhdGguIEJlY2F1c2Ugb2YgdGhhdCwgdGhlIFJJU0MtViBwdWJsaWMK
cHRlcF9nZXRfbG9ja2xlc3MoKSBtYXksIGZvciBhIFN2bmFwb3QgUFRFLCByZXR1cm4gdGhlIHN1
Yi1QVEUgZm9yIHRoZQpjdXJyZW50IGFkZHJlc3MgZXhwZWN0ZWQgYnkgZ2VuZXJpYyBNTSwgYWZ0
ZXIgY2hlY2tpbmcgdGhlIHdob2xlIE5BUE9UIHJhbmdlCmZvciBjb25zaXN0ZW5jeSBhbmQgYWdn
cmVnYXRpbmcgYmxvY2std2lkZSBBL0QgYml0cy4KCmZhc3QtR1VQIGhhcyBhIG5hcnJvd2VyIHJl
cXVpcmVtZW50LiBJdCBuZWVkcyB0aGUgUFRFIGZvciB0aGUgY3VycmVudCBhZGRyZXNzCmZvciBw
ZXJtaXNzaW9uL1BGTi9wYWdlIGxvb2t1cCwgdGhlbiBwaW5zIHRoZSBwYWdlLCBhbmQgZmluYWxs
eSBjaGVja3MgdGhhdAp0aGUgcGFnZSB0YWJsZSBlbnRyeSBpdCByZWxpZWQgb24gZGlkIG5vdCBj
aGFuZ2UgZHVyaW5nIHRoZSBwaW4uIGZhc3QtR1VQIGRvZXMKbm90IGNvbnN1bWUgdGhlIGJsb2Nr
LXdpZGUgQS9EIGFnZ3JlZ2F0aW9uLiBJZiBmYXN0LUdVUCB1c2VzIHRoZSBwdWJsaWMKcHRlcF9n
ZXRfbG9ja2xlc3MoKSBmb3IgYm90aCB0aGUgaW5pdGlhbCByZWFkIGFuZCB0aGUgcmV2YWxpZGF0
aW9uLCBpdCBwYXlzCnRoZSBjb3N0IG9mIHRoZSBOQVBPVCByYW5nZSBzY2FuIGFuZCBBL0QgYWdn
cmVnYXRpb24gaW4gdGhlIGZhc3QgcGF0aCwgZXZlbgp0aG91Z2ggdGhhdCBpbmZvcm1hdGlvbiBp
cyBub3QgdXNlZC4KClNvIHBhdGNoIDEwLzE1IGlzIG5vdCB0cnlpbmcgdG8gd3JhcCBhIHNpbXBs
ZSBlcXVhbGl0eSBjaGVjay4gVGhlIGludGVudCBpcyB0bwpzZXBhcmF0ZSB0d28gc2VtYW50aWNz
OiB0aGUgY3VycmVudC1hZGRyZXNzIFBURSBjb25zdW1lZCBieSBmYXN0LUdVUCwgYW5kIHRoZQpv
cmlnaW5hbCBQVEUgc25hcHNob3QgdXNlZCBmb3IgcG9zdC1waW4gcmV2YWxpZGF0aW9uLiBPbiBu
b3JtYWwgYXJjaGl0ZWN0dXJlcwp0aGVzZSBhcmUgdGhlIHNhbWUgdmFsdWUsIGFuZCB0aGUgZGVm
YXVsdCBpbXBsZW1lbnRhdGlvbiBwcmVzZXJ2ZXMgdGhlCmV4aXN0aW5nIHB0ZXBfZ2V0X2xvY2ts
ZXNzKCkgYmVoYXZpb3IuIE9uIFJJU0MtViBTdm5hcG90LCB0aGUgdmFsdWUgY29uc3VtZWQKYnkg
ZmFzdC1HVVAgaXMgdGhlIHN1Yi1QVEUsIHdoaWxlIHJldmFsaWRhdGlvbiBjb21wYXJlcyB3aGV0
aGVyIHRoZSByYXcKc25hcHNob3QgaGFzIGNoYW5nZWQuCgpQYXRjaCAxMS8xNSBpcyB0aGUgUklT
Qy1WIHVzZSBvZiB0aGlzIGhvb2suIEl0IGF2b2lkcyB0aGUgcHVibGljCnB0ZXBfZ2V0X2xvY2ts
ZXNzKCkgYmxvY2std2lkZSBBL0QgYWdncmVnYXRpb24gcGF0aCBpbiBmYXN0LUdVUCwgd2hpbGUg
c3RpbGwKa2VlcGluZyBjb3JyZWN0bmVzcyB0aHJvdWdoIHJhdyBzbmFwc2hvdCByZXZhbGlkYXRp
b24uIEluIHRoZSA2NEsgVEhQIGFsd2F5cwptb2RlLCBmaW8gNEsgcmFuZG9tIGRpcmVjdCByZWFk
IGltcHJvdmVkIGZyb20gMi42MTVNIElPUFMgLyA5Ljk3R2lCL3MgdG8KMi44NzRNIElPUFMgLyAx
MS4wR2lCL3MsIGFuZCB0aGUgYXZlcmFnZSBjbGF0IGRyb3BwZWQgZnJvbSA5NS41NCB1c2VjIHRv
Cjg2Ljk3IHVzZWMuCgpSZWdhcmRpbmcgdGhlIFJGQy9DYyBpc3N1ZSwgeW91IGFyZSByaWdodCwg
SSBoYW5kbGVkIHRoYXQgcG9vcmx5LiBBbHRob3VnaAp0aGlzIHNlcmllcyBpcyBtYWlubHkgYWJv
dXQgUklTQy1WIFN2bmFwb3QsIHBhdGNoIDEwLzE1IGFkZHMgYSBnZW5lcmljIE1NL0dVUApoZWxw
ZXIgYW5kIHBhdGNoIDEyLzE1IGFsc28gY2hhbmdlcyB0aGUgYXJtNjQgY29udHB0ZSBmYXN0LUdV
UCBwYXRoLCBzbyB0aGV5CmFyZSBubyBsb25nZXIgUklTQy1WLWxvY2FsIGNoYW5nZXMuIEkgd2Fz
IHdvcnJpZWQgdGhhdCB0aGUgbGFyZ2UgbGlzdCBvZgppbmRpdmlkdWFsIHJlY2lwaWVudHMgZnJv
bSBnZXRfbWFpbnRhaW5lci5wbCB3b3VsZCBjcmVhdGUgdG9vIG11Y2ggbm9pc2UsIHNvCkkgbW9z
dGx5IGtlcHQgdGhlIG1haWxpbmcgbGlzdHMgYW5kIGRyb3BwZWQgc29tZSBpbmRpdmlkdWFsIENj
J3MuIFRoYXQgd2FzIGEKYmFkIGNhbGw7IHRoZSByZWxldmFudCBtYWludGFpbmVycy9yZXZpZXdl
cnMgc2hvdWxkIGhhdmUgYmVlbiBDYydlZApleHBsaWNpdGx5LiBTb3JyeSBhYm91dCB0aGF0LgoK
Rm9yIHRoZSBuZXh0IHZlcnNpb24sIEkgd2lsbCBzcGxpdCB0aGUgZ2VuZXJpYyBmYXN0LUdVUCBo
ZWxwZXIgb3V0IGFzIGEKc2VwYXJhdGUgUkZDLCBhZGQgdGhlIHJlbGV2YW50IE1NL0dVUC9hcm02
NC9SSVNDLVYgbWFpbnRhaW5lcnMgYW5kIHJldmlld2Vycwp0byBDYywgYW5kIGV4cGxhaW4gdGhl
IHNlbWFudGljIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgUFRFIGNvbnN1bWVkIGJ5CmZhc3QtR1VQ
IGFuZCB0aGUgcG9zdC1waW4gcmV2YWxpZGF0aW9uIHNuYXBzaG90LiBJZiBJIGtlZXAgdGhlIGFy
bTY0Cm9wdGltaXphdGlvbiwgSSB3aWxsIGluY2x1ZGUgdGhlIGFybTY0IG1haW50YWluZXJzL3Jl
dmlld2VycyBpbiB0aGF0IFJGQzsKb3RoZXJ3aXNlIEkgd2lsbCBkcm9wIGl0IGZyb20gdGhlIFJJ
U0MtViBzZXJpZXMgZm9yIG5vdy4gSSB3aWxsIGFsc28gaW1wcm92ZQp0aGUgbmFtaW5nLCBzdWNo
IGFzIGByYXdwYC9gcmF3X3B0ZWAsIGFuZCBhZGQgY29tbWVudHMgdG8gbWFrZSB0aGUgc25hcHNo
b3QKc2VtYW50aWNzIGNsZWFyZXIuCgo+Cj4gPgo+ID4gSW50cm9kdWNlIGZhc3QtR1VQIHNwZWNp
ZmljIFBURSBzbmFwc2hvdCBhbmQgcmV2YWxpZGF0aW9uIGhlbHBlcnMuIFRoZQo+ID4gZGVmYXVs
dCBpbXBsZW1lbnRhdGlvbiBwcmVzZXJ2ZXMgdGhlIGV4aXN0aW5nIHB0ZXBfZ2V0X2xvY2tsZXNz
KCkKPiA+IHNlbWFudGljcywgd2hpbGUgYWxsb3dpbmcgYXJjaGl0ZWN0dXJlcyB0byBvdmVycmlk
ZSB0aGUgaGVscGVycyB3aGVuIHRoZQo+ID4gcHVibGljIGxvY2tsZXNzIGdldHRlciBwcm92aWRl
cyBleHRyYSBzZW1hbnRpY3MgdGhhdCBmYXN0LUdVUCBkb2VzIG5vdAo+ID4gY29uc3VtZS4KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4K
PiA+IC0tLQo+ID4gIGluY2x1ZGUvbGludXgvcGd0YWJsZS5oIHwgMTggKysrKysrKysrKysrKysr
KysrCj4gPiAgbW0vZ3VwLmMgICAgICAgICAgICAgICAgfCAgNiArKysrLS0KPiA+ICAyIGZpbGVz
IGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvcGd0YWJsZS5oIGIvaW5jbHVkZS9saW51eC9wZ3RhYmxlLmgK
PiA+IGluZGV4IGRhMTQzMjgwOTNhODYuLjYyOTQzZmNiZjcwNDYgMTAwNjQ0Cj4gPiAtLS0gYS9p
bmNsdWRlL2xpbnV4L3BndGFibGUuaAo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9wZ3RhYmxlLmgK
PiA+IEBAIC04MTMsNiArODEzLDI0IEBAIHN0YXRpYyBpbmxpbmUgcHRlX3QgcHRlcF9nZXRfbG9j
a2xlc3MocHRlX3QgKnB0ZXApCj4gPiAgfQo+ID4gICNlbmRpZgo+ID4KPgo+IE9mIGNvdXJzZSwg
bm8gY29tbWVudHMsIGhlbHBmdWwhCj4KPiA+ICsjaWZuZGVmIGd1cF9wdGVwX2dldF9sb2NrbGVz
cwo+ID4gK3N0YXRpYyBpbmxpbmUgcHRlX3QgZ3VwX3B0ZXBfZ2V0X2xvY2tsZXNzKHB0ZV90ICpw
dGVwLCBwdGVfdCAqcmF3cCkKPgo+IHJhd3A/IFRoaXMgaXMgdGVycmlibGUgbmFtaW5nLgo+Cj4g
QW5kICdndXBfcHRlcF9nZXRfbG9ja2xlc3MoKScgaXMgd29yc2UuIFdoYXQgb24gZWFydGggaXMg
dGhpcyBmdW5jdGlvbiBtZWFudCB0bwo+IGRvPyBBbmQgd2h5IGlzICdndXAgbG9ja2xlc3MnIGNv
bnNpZGVyZWQgZGlmZmVyZW50IGZyb20gbG9ja2xlc3M/Cj4KPiBBbmQgeW91IHJldHVybiB0aGUg
dmFsdWUgdHdpY2UsIGJlY2F1c2Ugb2YgY291cnNlIHlvdSBkby4gV2h5PyBXaG8ga25vd3MuCj4K
PiA+ICt7Cj4gPiArICAgICBwdGVfdCBwdGUgPSBwdGVwX2dldF9sb2NrbGVzcyhwdGVwKTsKPiA+
ICsKPiA+ICsgICAgICpyYXdwID0gcHRlOwo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIHB0ZTsKPiA+
ICt9Cj4gPiArI2VuZGlmCj4gPiArCj4gPiArI2lmbmRlZiBndXBfcHRlcF9yZXZhbGlkYXRlCj4g
PiArc3RhdGljIGlubGluZSBib29sIGd1cF9wdGVwX3JldmFsaWRhdGUocHRlX3QgKnB0ZXAsIHB0
ZV90IHJhd19wdGUpCj4gPiArewo+ID4gKyAgICAgcmV0dXJuIHB0ZV92YWwocmF3X3B0ZSkgPT0g
cHRlX3ZhbChwdGVwX2dldF9sb2NrbGVzcyhwdGVwKSk7Cj4gPiArfQo+Cj4gQWdhaW4gdGhpcyBu
YW1pbmcgaXMgdXR0ZXJseSB0ZXJyaWJsZSBhbmQgSSdtIGF0IGEgbG9zcyBhcyB0byB3aHkgb24g
ZWFydGgKPiB5b3UncmUgZG9pbmcgdGhpcz8KPgo+IFdlIGRvbid0IG5lZWQgdG8gYWJzdHJhY3Qg
ZXF1YWxpdHkgY2hlY2tzPwo+Cj4gPiArI2VuZGlmCj4gPiArCj4gPiAgI2lmbmRlZiBwbWRwX2dl
dF9sb2NrbGVzcwo+ID4gIHN0YXRpYyBpbmxpbmUgcG1kX3QgcG1kcF9nZXRfbG9ja2xlc3MocG1k
X3QgKnBtZHApCj4gPiAgewo+ID4gZGlmZiAtLWdpdCBhL21tL2d1cC5jIGIvbW0vZ3VwLmMKPiA+
IGluZGV4IDk5OTAyYzE1NzAzYjAuLjcyZmIxNDcxOTNlNTUgMTAwNjQ0Cj4gPiAtLS0gYS9tbS9n
dXAuYwo+ID4gKysrIGIvbW0vZ3VwLmMKPiA+IEBAIC0yODQyLDEwICsyODQyLDEyIEBAIHN0YXRp
YyBpbnQgZ3VwX2Zhc3RfcHRlX3JhbmdlKHBtZF90IHBtZCwgcG1kX3QgKnBtZHAsIHVuc2lnbmVk
IGxvbmcgYWRkciwKPiA+ICAgICAgIGlmICghcHRlcCkKPiA+ICAgICAgICAgICAgICAgcmV0dXJu
IDA7Cj4gPiAgICAgICBkbyB7Cj4gPiAtICAgICAgICAgICAgIHB0ZV90IHB0ZSA9IHB0ZXBfZ2V0
X2xvY2tsZXNzKHB0ZXApOwo+ID4gKyAgICAgICAgICAgICBwdGVfdCByYXdfcHRlLCBwdGU7Cj4K
PiBXaGF0IG9uIGVhcnRoIGlzIGEgJ3JhdycgUFRFPwo+Cj4gPiAgICAgICAgICAgICAgIHN0cnVj
dCBwYWdlICpwYWdlOwo+ID4gICAgICAgICAgICAgICBzdHJ1Y3QgZm9saW8gKmZvbGlvOwo+ID4K
PiA+ICsgICAgICAgICAgICAgcHRlID0gZ3VwX3B0ZXBfZ2V0X2xvY2tsZXNzKHB0ZXAsICZyYXdf
cHRlKTsKPiA+ICsKPiA+ICAgICAgICAgICAgICAgLyoKPiA+ICAgICAgICAgICAgICAgICogQWx3
YXlzIGZhbGxiYWNrIHRvIG9yZGluYXJ5IEdVUCBvbiBQUk9UX05PTkUtbWFwcGVkIHBhZ2VzOgo+
ID4gICAgICAgICAgICAgICAgKiBwdGVfYWNjZXNzX3Blcm1pdHRlZCgpIGJldHRlciBzaG91bGQg
cmVqZWN0IHRoZXNlIHBhZ2VzCj4gPiBAQCAtMjg3MSw3ICsyODczLDcgQEAgc3RhdGljIGludCBn
dXBfZmFzdF9wdGVfcmFuZ2UocG1kX3QgcG1kLCBwbWRfdCAqcG1kcCwgdW5zaWduZWQgbG9uZyBh
ZGRyLAo+ID4gICAgICAgICAgICAgICAgICAgICAgIGdvdG8gcHRlX3VubWFwOwo+ID4KPiA+ICAg
ICAgICAgICAgICAgaWYgKHVubGlrZWx5KHBtZF92YWwocG1kKSAhPSBwbWRfdmFsKHBtZHBfZ2V0
X2xvY2tsZXNzKHBtZHApKSkgfHwKPiA+IC0gICAgICAgICAgICAgICAgIHVubGlrZWx5KHB0ZV92
YWwocHRlKSAhPSBwdGVfdmFsKHB0ZXBfZ2V0X2xvY2tsZXNzKHB0ZXApKSkpIHsKPiA+ICsgICAg
ICAgICAgICAgICAgIHVubGlrZWx5KCFndXBfcHRlcF9yZXZhbGlkYXRlKHB0ZXAsIHJhd19wdGUp
KSkgewo+Cj4gV2h5IGRvIHdlIG5lZWQgdG8gcmVmYWRjdG9yIGEgY29tcGFyaXNvbiBiZXR3ZWVu
IGEgbG9jYWwgdmFyaWFibGUgYW5kIGEgbG9ja2xlc3MKPiBnZXQ/Cj4KPiBJJ20ganVzdCBzbyBj
b25mdXNlZCBieSB3aGF0IG9uIGVhcnRoIHRoaXMgcGF0Y2ggaXMgbWVhbnQgdG8gYmUgb3Igd2h5
IGl0J3MgaGVyZS4uLgo+Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgZ3VwX3B1dF9mb2xpbyhm
b2xpbywgMSwgZmxhZ3MpOwo+ID4gICAgICAgICAgICAgICAgICAgICAgIGdvdG8gcHRlX3VubWFw
Owo+ID4gICAgICAgICAgICAgICB9Cj4gPiAtLQo+ID4gMi4zOS41Cj4gPgo+ID4KPiA+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKPiA+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IGh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPgo+
IC0tCj4gQ2hlZXJzLCBMb3JlbnpvCgoKVGhhbmtzLApZdW5odWkKCi0tIAprdm0tcmlzY3YgbWFp
bGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
