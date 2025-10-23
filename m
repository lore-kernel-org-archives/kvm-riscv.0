Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3627ACCD193
	for <kvm-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 17:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ot4BKvNJ2dps1azVb6lovEipiNoTTf7EhQ7W6u5xDaY=; b=o3EjUcpS6zy1hyYC6ZGZa6Rm2w
	f4Qz3c2n4QLsQFMqLiP1r76+R3l1rHaKSpcCNdRdJOmYquAxfi1bF6JDSDxQ4VW90UgEl1N8hM7W2
	gEUhrJZvTWSytrp3E9Uq4TIRQ3Z5I0ZuHKtQY119wc0F+Y4gjv3HwigiLik9fZJa5uRHApjD7Zs5c
	QmwvYoUrR2DbS2qEU81qbxqwt9cfpvC36Vgk9BAPAumoe5VToTm1JKgR9exFpHag8CoD5jJO+mkE4
	UsqjMjky91Y2uNlEFANJ9+MKDp3MIS01RhFS9Xi63A2ziwzEm54Otvw1D8W7O8JnQnvPI1l+eGFVu
	Hr/Npjtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBz5w-000000074Mk-3DYC;
	Thu, 23 Oct 2025 17:27:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBz5v-000000074Lt-1I5L
	for kvm-riscv@bombadil.infradead.org;
	Thu, 23 Oct 2025 17:27:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PMd4YohbYBDUY30TTRBHmO9DyPvx8MjhdR/tVFXtYYI=; b=F7qoV4xHqmi1OROmNkOFEliMRZ
	90BEbxtYKzmp8ndbMN7mhOu891g6uOElqaqNv/mgDMZitaYMfaVSs6+dRxCOnW5v1ok23Po6VlOoe
	kASj14q193LogqMa2WJDG8Ex/aTRDLHLbQvLWFyDmaxCmXdMlhs+lWQa2L+v6vxnFVxvoMwA5SM+V
	ujMJmn6wKQpUTwbD3p3iL7mzyAo2P8y8KWqb3Fkf0e1De+PGf2YVYIv2MDzkIaGfTtlJ3JNbSDS49
	vfa92PYdFW2k2H/KnNReWr0nOFHm21ezLRKYmJnQGYiKg/1G1WqMp2O8bcW2YLa5Hg+CBVxuMrbPy
	CRZJtN/Q==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vByED-00000001XfZ-19FW
	for kvm-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 16:31:55 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-269880a7bd9so11740655ad.3
        for <kvm-riscv@lists.infradead.org>; Thu, 23 Oct 2025 10:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761240437; x=1761845237; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMd4YohbYBDUY30TTRBHmO9DyPvx8MjhdR/tVFXtYYI=;
        b=KHA/adG+IcBFOsmsbEhv36qbaAIED+9Tsgl2OhqqmJXaecO8DHNOqS9r0/bw2jI/Pc
         LDicPkN/j5u+yxf50fIttRGvAhfSFI3MiC5qGp75zZtHq99UlWl0SB6cw7qa6PCTP2MA
         otUBHyfD5z0V7Mvz/Yxb2xrP0m2wJVQLQhZQ0iKZIHUYAwk+kghlo8DpubgxB1JvK8Mf
         a5g+tsrd4X2uAM54GSnlRNbb8g4DBZoG3lk//83dx+USzmvklfNaP+qoEAWBoqHnjcRD
         4Jbze3pjJkxPFxRZgKM/vs7btFF5jmND3DcxzxxO829wyscEumAb23TOw+2VGiKXbLRk
         MeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761240437; x=1761845237;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PMd4YohbYBDUY30TTRBHmO9DyPvx8MjhdR/tVFXtYYI=;
        b=h2H4WFqY0YzDe4E69i6Vw5CpscAAELH47vicly5KkWdcLufa96NE71JC95vf4DYZfK
         hU7NPTz42NTQAhCdESkdqG8QNw/jAcqRfOBgtCXPLy97QS7ov0bOLSU2BKD8NVDbkZ4S
         lPsZTlHCW0imGyHqzHPxLdqRcCrY/FlkCaUMwt+3DLROR4tpaIyqXZIaeDcoB/qu7FPq
         eKw+AHF9moEVT/+Mcib8J3HD+axT+plfIw2CuNl8nYBsmas2oCiThrtToeFWhLbXCQwQ
         7pwxWdOTJTXSZVtc756EwbEOQsCS+mGZhnJZrCGLufBuLGGuj1AwPhvJFYnLJLjFnWtD
         5Vxw==
X-Forwarded-Encrypted: i=1; AJvYcCVUvp55VIYrXhb+HiTjaNYg+XTcZl8uFlRKMpLGqEGn3zgehovAUG6NSHQiekxEgubSNjArQpxRWhw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxWeUM/aPo/De2l3t8ujJVTTr0sSt5Al+7QxyrE05XNYq7WEfnh
	0FdhY654igA/Oj4QMbB0L/GzvOvtbGRYvhoCa2FEHxzTCWBGLlQ1BSAlEtmdY5VwTr/NfWrmYAj
	jm0plDA==
X-Google-Smtp-Source: AGHT+IFjhG//1khxmFCKdE4+6wWu9+6PA/jOl4XyR0eCgR53v+ZECkEt8twGk0B4jVNQwQCsevpreYrKXxc=
X-Received: from pjuj5.prod.google.com ([2002:a17:90a:d005:b0:33b:a35b:861])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:db11:b0:240:48f4:40f7
 with SMTP id d9443c01a7336-290cba4efc9mr387536115ad.39.1761240437319; Thu, 23
 Oct 2025 10:27:17 -0700 (PDT)
Date: Thu, 23 Oct 2025 10:27:16 -0700
In-Reply-To: <707a01ee36c28863bdc6a4444a5560e9a0b19597.camel@intel.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-15-seanjc@google.com>
 <707a01ee36c28863bdc6a4444a5560e9a0b19597.camel@intel.com>
Message-ID: <aPpldKdiQYYnl4uC@google.com>
Subject: Re: [PATCH v3 14/25] KVM: TDX: Bug the VM if extended the initial
 measurement fails
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, 
	"maz@kernel.org" <maz@kernel.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"kas@kernel.org" <kas@kernel.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, 
	"zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, "anup@brainfault.org" <anup@brainfault.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Kai Huang <kai.huang@intel.com>, 
	Yan Y Zhao <yan.y.zhao@intel.com>, "michael.roth@amd.com" <michael.roth@amd.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	Vishal Annapurve <vannapurve@google.com>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_173153_683801_BB47329B 
X-CRM114-Status: GOOD (  19.43  )
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

T24gVHVlLCBPY3QgMjEsIDIwMjUsIFJpY2sgUCBFZGdlY29tYmUgd3JvdGU6Cj4gT24gVGh1LCAy
MDI1LTEwLTE2IGF0IDE3OjMyIC0wNzAwLCBTZWFuIENocmlzdG9waGVyc29uIHdyb3RlOgo+ID4g
V0FSTiBhbmQgdGVybWluYXRlIHRoZSBWTSBpZiBUREhfTVJfRVhURU5EIGZhaWxzLCBhcyBleHRl
bmRpbmcgdGhlCj4gPiBtZWFzdXJlbWVudCBzaG91bGQgZmFpbCBpZiBhbmQgb25seSBpZiB0aGVy
ZSBpcyBhIEtWTSBidWcsIG9yIGlmIHRoZSBTLUVQVAo+ID4gbWFwcGluZyBpcyBpbnZhbGlkLCBh
bmQgaXQgc2hvdWxkIGJlIGltcG9zc2libGUgZm9yIHRoZSBTLUVQVCBtYXBwaW5ncyB0bwo+ID4g
YmUgcmVtb3ZlZCBiZXR3ZWVuIGt2bV90ZHBfbW11X21hcF9wcml2YXRlX3BmbigpIGFuZCB0ZGhf
bXJfZXh0ZW5kKCkuCj4gPiAKPiA+IEhvbGRpbmcgc2xvdHNfbG9jayBwcmV2ZW50cyB6YXBzIGR1
ZSB0byBtZW1zbG90IHVwZGF0ZXMsCj4gPiBmaWxlbWFwX2ludmFsaWRhdGVfbG9jaygpIHByZXZl
bnRzIHphcHMgZHVlIHRvIGd1ZXN0X21lbWZkIFBVTkNIX0hPTEUsCj4gPiBhbmQgYWxsIHVzYWdl
IG9mIGt2bV96YXBfZ2ZuX3JhbmdlKCkgaXMgbXV0dWFsbHkgZXhjbHVzaXZlIHdpdGggUy1FUFQK
PiA+IGVudHJpZXMgdGhhdCBjYW4gYmUgdXNlZCBmb3IgdGhlIGluaXRpYWwgaW1hZ2UuwqAgVGhl
IGNhbGwgZnJvbSBzZXYuYyBpcwo+ID4gb2J2aW91c2x5IG11dHVhbGx5IGV4Y2x1c2l2ZSwgVERY
IGRpc2FsbG93cyBLVk1fWDg2X1FVSVJLX0lHTk9SRV9HVUVTVF9QQVQKPiA+IHNvIHNhbWUgZ29l
cyBmb3Iga3ZtX25vbmNvaGVyZW50X2RtYV9hc3NpZ25tZW50X3N0YXJ0X29yX3N0b3AsIGFuZCB3
aGlsZQo+ID4gX19rdm1fc2V0X29yX2NsZWFyX2FwaWN2X2luaGliaXQoKSBjYW4gbGlrZWx5IGJl
IHRyaXBwZWQgd2hpbGUgYnVpbGRpbmcgdGhlCj4gPiBpbWFnZSwgdGhlIEFQSUMgcGFnZSBoYXMg
aXRzIG93biBub24tZ3Vlc3RfbWVtZmQgbWVtc2xvdCBhbmQgc28gY2FuJ3QgYmUKPiA+IHVzZWQg
Zm9yIHRoZSBpbml0aWFsIGltYWdlLCB3aGljaCBtZWFucyB0aGF0IHRvbyBpcyBtdXR1YWxseSBl
eGNsdXNpdmUuCj4gPiAKPiA+IE9wcG9ydHVuaXN0aWNhbGx5IHN3aXRjaCB0byAiZ290byIgdG8g
anVtcCBhcm91bmQgdGhlIG1lYXN1cmVtZW50IGNvZGUsCj4gPiBwYXJ0bHkgdG8gbWFrZSBpdCBj
bGVhciB0aGF0IEtWTSBuZWVkcyB0byBiYWlsIGVudGlyZWx5IGlmIGV4dGVuZGluZyB0aGUKPiA+
IG1lYXN1cmVtZW50IGZhaWxzLCBwYXJ0bHkgaW4gYW50aWNpcGF0aW9uIG9mIHJld29ya2luZyBo
b3cgYW5kIHdoZW4KPiA+IFRESF9NRU1fUEFHRV9BREQgaXMgZG9uZS4KPiA+IAo+ID4gRml4ZXM6
IGQ3ODlmYTZlZmFjOSAoIktWTTogVERYOiBIYW5kbGUgdkNQVSBkaXNzb2NpYXRpb24iKQo+ID4g
U2lnbmVkLW9mZi1ieTogWWFuIFpoYW8gPHlhbi55LnpoYW9AaW50ZWwuY29tPgo+ID4gU2lnbmVk
LW9mZi1ieTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Cj4gPiAtLS0K
PiAKPiBQZXIgdGhlIGRpc2N1c3Npb24gaW4gdjIsIHNob3VsZG4ndCBpdCBnbyBhZnRlciBwYXRj
aCAyNCAnS1ZNOiBURFg6IEd1YXJkIFZNCj4gc3RhdGUgdHJhbnNpdGlvbnMgd2l0aCAiYWxsIiB0
aGUgbG9ja3MnPyBPdGhlcndpc2UgaXQgaW50cm9kdWNlcyBhIEtWTV9CVUdfT04oKQo+IHRoYXQg
Y2FuIGJlIHRyaWdnZXJlZCBmcm9tIHVzZXJzcGFjZS4gbm90IGEgaHVnZSBkZWFsIHRob3VnaC4K
Ck9oLCByaWdodC4gIEFuZCB0aGVuIHRoZSBjaGFuZ2Vsb2cgbmVlZHMgdG8gYmUgdXBkYXRlZCB0
b28uCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNj
dgo=
