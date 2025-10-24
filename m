Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46316CCD1AB
	for <kvm-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 10:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uZ/gxbaCJvSc9vQyXkF0nldVCAKLV2nYWRJXT7u/mW0=; b=GJ0DYNQUtc0ZRv
	Igsy2V3FJnZRj5iFBv+IXuI2CYt22diC76OPoB3JWWG1F98lyO9DFPghygLqfTcqX+szJS3+UZgb6
	SeYBsBS8NFNA4/n4ltf/aaORv3F8NqMdnRNrY5tBeYlloCL9WtSPHz4fOO8T37mmZ9KsG/66JGKgj
	wMnuf1lag//1ppTbRmUfHY2lcvTImCM1US4EmrGe5p45LelITMifU78xODtt1MwLNyDw5KDC3upqc
	K61seQWvHF4vRQI4BLvYBC7Hepl2tgkzgpuphT/SHGEbPH3RFnAhp11quls2lYZiKcYilTwT5R3dw
	l+Vm5QU0AiJHVIFlwkiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCEe4-00000008xP6-420z;
	Fri, 24 Oct 2025 10:03:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCEe3-00000008xOt-2lmW
	for kvm-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 10:03:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B0EC61D4A
	for <kvm-riscv@lists.infradead.org>; Fri, 24 Oct 2025 10:03:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 668EDC19422
	for <kvm-riscv@lists.infradead.org>; Fri, 24 Oct 2025 10:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761300218;
	bh=OvBlFaevsT1aA4REwFPwyDUpfGwB/p8ycFjHvvBC4PM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UkDYfGaPl3QeT3lzukEEpYg3j7WqD67FkrFiw0qXNJ1OngbZ0ue7Z+oth7PF4a19e
	 6c4wW6rYWMOO3kGSqHqjs0gf2mZW3mpXB+go1zxx94lOAEG4QTcPJfgMqvwsgPaIdK
	 BGuApr7nzn9bW0K8lCpMUfc/MJQgyd8waGbSQlnbRLbpClBx+pBGPF2EJATb4y4zo2
	 5jJ3gXFhhuOnedfLTooQbJGt/cSwqO6xnxDjcnwBlBLjjt8yGJJNIvTqzknmd/Bi1h
	 5GPkIuPtWR7tRkNzHlBzI01FFlc8TU3KeX1lEFwfumePMr6CCvr55zSZdhFui7G3QY
	 Xpx0E3GuJ4KJA==
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3ece1102998so1247807f8f.2
        for <kvm-riscv@lists.infradead.org>; Fri, 24 Oct 2025 03:03:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXbv6m+N1rOkJLu575iJDlwrpedojddwEguBVb16XrlLJ0UNxx+9uOSpup528Aq9+BOJUQfhBOhTBo=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu+mD4ezzWec2PuE/MmUzvGJebTxFBB33qKM03edCBMLNl4wyi
	klLhSxqCreYyRyqxqBWWsBg2mFaOhxTcaNksMpIlUM5Ny8k3bHnQXTXm9tFgj9X97XNBWZ5Qi6n
	QijzxNckFeXIeud+BIprbBc+cuc270io=
X-Google-Smtp-Source: AGHT+IHLVMglfM02a482Z0S013OS339/r6JWMeLQ6qF2S7OgbygGhNbTGwvWCNz8euYcwQmbbn1WPiA92/Bwgk0PmhM=
X-Received: by 2002:a5d:5f93:0:b0:427:4b0:b3f9 with SMTP id
 ffacd0b85a97d-4298a04071bmr4218935f8f.3.1761300216861; Fri, 24 Oct 2025
 03:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <20251020130801.68356-1-fangyu.yu@linux.alibaba.com>
 <CAJF2gTRwHJsA7jFvAXbqy-6LyfaVTqfsFXgHfAeOZ8M3JNsikg@mail.gmail.com> <CAAhSdy1j4HZ86V6VsSF80LuNoxB3L3fmYYtvT7LU93fhbgCuug@mail.gmail.com>
In-Reply-To: <CAAhSdy1j4HZ86V6VsSF80LuNoxB3L3fmYYtvT7LU93fhbgCuug@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 24 Oct 2025 03:03:23 -0700
X-Gmail-Original-Message-ID: <CAJF2gTS-qZDgxsqxr7OjZijwxc4GY2MKCabMbE3wvtzx0TDixQ@mail.gmail.com>
X-Gm-Features: AWmQ_blhM55OVCZL-ZLmRVyNahAkanXv0XqjK7NIOuPTDZ21CIGaNvU6roof5hI
Message-ID: <CAJF2gTS-qZDgxsqxr7OjZijwxc4GY2MKCabMbE3wvtzx0TDixQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Remove automatic I/O mapping for VM_PFNMAP
To: Anup Patel <anup@brainfault.org>
Cc: fangyu.yu@linux.alibaba.com, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, pbonzini@redhat.com, 
	jiangyifei@huawei.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, jgg@nvidia.com, 
	alex.williamson@redhat.com
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

T24gRnJpLCBPY3QgMjQsIDIwMjUgYXQgMTI6MzLigK9BTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgT2N0IDIxLCAyMDI1IGF0IDg6NTjigK9QTSBH
dW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBPY3QgMjAs
IDIwMjUgYXQgNjowOOKAr0FNIDxmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20+IHdyb3RlOgo+
ID4gPgo+ID4gPiBGcm9tOiBGYW5neXUgWXUgPGZhbmd5dS55dUBsaW51eC5hbGliYWJhLmNvbT4K
PiA+ID4KPiA+ID4gQXMgb2YgY29tbWl0IGFhYzZkYjc1YTlmYyAoInZmaW8vcGNpOiBVc2UgdW5t
YXBfbWFwcGluZ19yYW5nZSgpIiksCj4gPiA+IHZtX3Bnb2ZmIG1heSBubyBsb25nZXIgZ3VhcmFu
dGVlZCB0byBob2xkIHRoZSBQRk4gZm9yIFZNX1BGTk1BUAo+ID4gPiByZWdpb25zLiBVc2luZyB2
bWEtPnZtX3Bnb2ZmIHRvIGRlcml2ZSB0aGUgSFBBIGhlcmUgbWF5IHRoZXJlZm9yZQo+ID4gPiBw
cm9kdWNlIGluY29ycmVjdCBtYXBwaW5ncy4KPiA+ID4KPiA+ID4gSW5zdGVhZCwgSS9PIG1hcHBp
bmdzIGZvciBzdWNoIHJlZ2lvbnMgY2FuIGJlIGVzdGFibGlzaGVkIG9uLWRlbWFuZAo+ID4gPiBk
dXJpbmcgZy1zdGFnZSBwYWdlIGZhdWx0cywgbWFraW5nIHRoZSB1cGZyb250IGlvcmVtYXAgaW4g
dGhpcyBwYXRoCj4gPiA+IGlzIHVubmVjZXNzYXJ5Lgo+ID4gPgo+ID4gPiBGaXhlczogOWQwNWMx
ZmVlODM3ICgiUklTQy1WOiBLVk06IEltcGxlbWVudCBzdGFnZTIgcGFnZSB0YWJsZSBwcm9ncmFt
bWluZyIpCj4gPiBUaGUgRml4ZXMgdGFnIHNob3VsZCBiZSAnY29tbWl0IGFhYzZkYjc1YTlmYyAo
InZmaW8vcGNpOiBVc2UKPiA+IHVubWFwX21hcHBpbmdfcmFuZ2UoKSIpJy4KPiA+Cj4gPiBBIHN0
YWJsZSB0cmVlIG5lY2Vzc2l0YXRlcyBtaW5pbWl6aW5nIHRoZSAiRml4ZXMgdGFnIiBpbnRlcmZl
cmVuY2UuCj4gPgo+ID4gV2UgYWxzbyBuZWVkIHRvCj4gPiBDYzogSmFzb24gR3VudGhvcnBlIDxq
Z2dAbnZpZGlhLmNvbT4KPiA+IENjOiBBbGV4IFdpbGxpYW1zb24gPGFsZXgud2lsbGlhbXNvbkBy
ZWRoYXQuY29tPgo+ID4gRm9yIHJldmlldy4KPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEZhbmd5
dSBZdSA8ZmFuZ3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGFyY2gv
cmlzY3Yva3ZtL21tdS5jIHwgMjAgKy0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTkgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9tbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gPiA+
IGluZGV4IDUyNWZiNWEzMzBjMC4uODRjMDRjOGYwODkyIDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNo
L3Jpc2N2L2t2bS9tbXUuYwo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+ID4gPiBA
QCAtMTk3LDggKzE5Nyw3IEBAIGludCBrdm1fYXJjaF9wcmVwYXJlX21lbW9yeV9yZWdpb24oc3Ry
dWN0IGt2bSAqa3ZtLAo+ID4gPgo+ID4gPiAgICAgICAgIC8qCj4gPiA+ICAgICAgICAgICogQSBt
ZW1vcnkgcmVnaW9uIGNvdWxkIHBvdGVudGlhbGx5IGNvdmVyIG11bHRpcGxlIFZNQXMsIGFuZAo+
ID4gPiAtICAgICAgICAqIGFueSBob2xlcyBiZXR3ZWVuIHRoZW0sIHNvIGl0ZXJhdGUgb3ZlciBh
bGwgb2YgdGhlbSB0byBmaW5kCj4gPiA+IC0gICAgICAgICogb3V0IGlmIHdlIGNhbiBtYXAgYW55
IG9mIHRoZW0gcmlnaHQgbm93Lgo+ID4gPiArICAgICAgICAqIGFueSBob2xlcyBiZXR3ZWVuIHRo
ZW0sIHNvIGl0ZXJhdGUgb3ZlciBhbGwgb2YgdGhlbS4KPiA+ID4gICAgICAgICAgKgo+ID4gPiAg
ICAgICAgICAqICAgICArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0rCj4gPiA+ICAgICAgICAgICogKy0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tKyAg
ICstLS0tLS0tLS0tLS0tLS0tKwo+ID4gPiBAQCAtMjI5LDMyICsyMjgsMTUgQEAgaW50IGt2bV9h
cmNoX3ByZXBhcmVfbWVtb3J5X3JlZ2lvbihzdHJ1Y3Qga3ZtICprdm0sCj4gPiA+ICAgICAgICAg
ICAgICAgICB2bV9lbmQgPSBtaW4ocmVnX2VuZCwgdm1hLT52bV9lbmQpOwo+ID4gPgo+ID4gPiAg
ICAgICAgICAgICAgICAgaWYgKHZtYS0+dm1fZmxhZ3MgJiBWTV9QRk5NQVApIHsKPiA+ID4gLSAg
ICAgICAgICAgICAgICAgICAgICAgZ3BhX3QgZ3BhID0gYmFzZV9ncGEgKyAodm1fc3RhcnQgLSBo
dmEpOwo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBwaHlzX2FkZHJfdCBwYTsKPiA+ID4g
LQo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBwYSA9IChwaHlzX2FkZHJfdCl2bWEtPnZt
X3Bnb2ZmIDw8IFBBR0VfU0hJRlQ7Cj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIHBhICs9
IHZtX3N0YXJ0IC0gdm1hLT52bV9zdGFydDsKPiA+ID4gLQo+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAvKiBJTyByZWdpb24gZGlydHkgcGFnZSBsb2dnaW5nIG5vdCBhbGxvd2VkICovCj4g
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChuZXctPmZsYWdzICYgS1ZNX01FTV9MT0df
RElSVFlfUEFHRVMpIHsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXQg
PSAtRUlOVkFMOwo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0
Owo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4gPiA+IC0KPiA+ID4gLSAgICAgICAg
ICAgICAgICAgICAgICAgcmV0ID0ga3ZtX3Jpc2N2X21tdV9pb3JlbWFwKGt2bSwgZ3BhLCBwYSwg
dm1fZW5kIC0gdm1fc3RhcnQsCj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB3cml0YWJsZSwgZmFsc2UpOwo+ID4gPiAtICAgICAgICAgICAg
ICAgICAgICAgICBpZiAocmV0KQo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGJyZWFrOwo+ID4gRGVmZXJpbmcgdGhlIGlvcmVtYXAgdG8gdGhlIGctc3RhZ2UgcGFnZSBmYXVs
dCBsb29rcyBnb29kIHRvIG1lLCBhcyBpdAo+ID4gc2ltcGxpZmllcyB0aGUgaW1wbGVtZW50YXRp
b24gaGVyZS4KPiA+Cj4gPiBBY2tlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4K
PiBJIHRoaW5rIHlvdSBtZWFudCBSZXZpZXdlZC1ieSBhbmQgbm90IEFja2VkLWJ5LgpZZXMsCgpS
ZXZpZXdlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cgo+Cj4gSSBoYXZlIHVwZGF0
ZWQgdGhlIEZpeGVzIHRhZyBhdCB0aGUgdGltZSBvZiBtZXJnaW5nLgpPa2F5LgoKPgo+IFJlZ2Fy
ZHMsCj4gQW51cAoKCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgotLSAKa3ZtLXJpc2N2IG1h
aWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
