Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5AFCCF9F0
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 23:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wm78/yxe3YgqDWs1Gc1oKN1MzHYn+h65lYY8zzsvQGU=; b=fzCuLALDyn+0YlCF+H9MTxJbCN
	XFWspJXXTZDe04rKN5iELNUAXS1ned3w0BGGeU0fwXAuMsYibEehwxPtS+e89xPotgzlBr/ozAfXm
	mdzKsK+FIG0neuduOnR1G5KEKA6bkGsOtyvy+P57rZX6f6DmSF7qc6WrVopXRVu0OnrddP386ui7q
	g3S3eVaj7YH4hiwm2Z/1cZzbRMh/GDgdKfSFZYE+clCG3IGbBXIPsnEE481M5PFw55ikCdwhZ5CXg
	dl7PukvwlQOoJhOnQ2njqQcq/tvOKTej1S31snfH+7pNuoy3PjDm3VwSb/Vg9+xU+TJK1E97ceD9v
	qP2NCTzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEcG6-000000059Kz-17Ye;
	Thu, 30 Oct 2025 23:40:46 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEcG3-000000059Jl-2Q0w
	for kvm-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 23:40:44 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-781171fe1c5so1554686b3a.0
        for <kvm-riscv@lists.infradead.org>; Thu, 30 Oct 2025 16:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761867642; x=1762472442; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hANv7xEJBy7S5lh8h/UQF87h23G6mY0gbFBLav72O2Q=;
        b=aQHhujZNkrYlJ62Nx4qs5RFuV2+c+S17Gi53th1eADFUK4+m2/15JnSqXYN+IsNaly
         ixkGIKUM2fjJNVHw/28t76SMb7vYI1wJG5Rmh8q6E6JMVcD5hy9IsXpRdUBG+QKzgv8V
         amlE/i7veAGsAm3/Mhf+t+n7tdbuRY6AEoZu54AgYR7pOP4tilbaKjw352mU4nn/4tT5
         iJ8qRxuS8zBszHyeno9PMDBHGIEQtA2jLKU5NEoQBjJ/tcdDXFHQU+LBlZEXQDzEdVGb
         4jLgtftVm7wCCIUNM9gj6LhJ6Ew6lZBSipjKY//kOTsfmVBHbjH6ZxFzK64Y+3cMPUHG
         b2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761867642; x=1762472442;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hANv7xEJBy7S5lh8h/UQF87h23G6mY0gbFBLav72O2Q=;
        b=qtX9cVdqF7ppO5Qi383YEqKdn0H4qXCbFrn4dkvwMWYP9aSxXmOamQYPoqtUevZasD
         bsyYEEK9Wif794aq34TubritGkVNRjkEUb6V4B6cTU8SQ4g0PjvEzGvp7VRCM7n/qmrL
         bG5JcVSUG77TzedP/8uuVJ2JHNFIQ50O2ztp/p1M5UoA9/gRR8XWZCnX9Sxn1A1Egj/0
         sBp+czGm8HOIcqF1fCC55kwIs1AqbMZwHvhNiFq9gMpo59/Lj78EYU5b2WfWa4Wfw35D
         pxoHuBKiIpSoQrY0OLYigKX4kw5NlOvIuzzZ1EQ1B6o9U/RpL/rSgBcnFaXnhwC4OHAk
         92JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHLo/H5PgTZ11uPybpe3mXa9lUEhUR08dersOIeZuHYtSFttMh3jiagryM17tn+p5GInp5nZwCAAw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyDnGG7v2satlXG+dbB7sW2+H9F2WvhEGVsuUTOX1TyJbckOJxK
	KutsRRoqgTyArK5b5cnoH+Lxnh78NNd6Z0KD2DFSYx3atRy8pWxYCMO1C1jX9dMgXqDMYZdNt8w
	qjOYAkQ==
X-Google-Smtp-Source: AGHT+IH6kktSpJB8uW8dOccHej0bRJlF9t4mdGsOdXoLRdKSPbgGpCfMdKkfH5SPES5/Onbr9IfT7/Ky4i8=
X-Received: from pfbhm7.prod.google.com ([2002:a05:6a00:6707:b0:77e:40c7:d12e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3996:b0:7a4:460e:f86a
 with SMTP id d2e1a72fcca58-7a7796c8a99mr1645968b3a.25.1761867642073; Thu, 30
 Oct 2025 16:40:42 -0700 (PDT)
Date: Thu, 30 Oct 2025 16:40:40 -0700
In-Reply-To: <6572689b28a76bd95bc653b1fc1131fa57ed7669.camel@intel.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com> <20251030200951.3402865-13-seanjc@google.com>
 <6572689b28a76bd95bc653b1fc1131fa57ed7669.camel@intel.com>
Message-ID: <aQP3eJmLTHscDoI4@google.com>
Subject: Re: [PATCH v4 12/28] KVM: TDX: WARN if mirror SPTE doesn't have full
 RWX when creating S-EPT mapping
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, 
	"maz@kernel.org" <maz@kernel.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"kas@kernel.org" <kas@kernel.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, 
	"zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, "anup@brainfault.org" <anup@brainfault.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, Vishal Annapurve <vannapurve@google.com>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_164043_619189_5C2903B2 
X-CRM114-Status: GOOD (  14.26  )
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

T24gVGh1LCBPY3QgMzAsIDIwMjUsIEthaSBIdWFuZyB3cm90ZToKPiBPbiBUaHUsIDIwMjUtMTAt
MzAgYXQgMTM6MDkgLTA3MDAsIFNlYW4gQ2hyaXN0b3BoZXJzb24gd3JvdGU6Cj4gPiBQYXNzIGlu
IHRoZSBtaXJyb3Jfc3B0ZSB0byBrdm1feDg2X29wcy5zZXRfZXh0ZXJuYWxfc3B0ZSgpIHRvIHBy
b3ZpZGUKPiA+IHN5bW1ldHJ5IHdpdGggLnJlbW92ZV9leHRlcm5hbF9zcHRlKCksIGFuZCBhc3Nl
cnQgaW4gVERYIHRoYXQgdGhlIG1pcnJvcgo+ID4gU1BURSBpcyBzaGFkb3ctcHJlc2VudCB3aXRo
IGZ1bGwgUldYIHBlcm1pc3Npb25zICh0aGUgVERYLU1vZHVsZSBkb2Vzbid0Cj4gPiBhbGxvdyB0
aGUgaHlwZXJ2aXNvciB0byBjb250cm9sIHByb3RlY3Rpb25zKS4KPiA+IAo+ID4gU2lnbmVkLW9m
Zi1ieTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Cj4gCj4gUmV2aWV3
ZWQtYnk6IEthaSBIdWFuZyA8a2FpLmh1YW5nQGludGVsLmNvbT4KPiAKPiBbLi4uXQo+IAo+ID4g
IHN0YXRpYyBpbnQgdGR4X3NlcHRfc2V0X3ByaXZhdGVfc3B0ZShzdHJ1Y3Qga3ZtICprdm0sIGdm
bl90IGdmbiwKPiA+IC0JCQkJICAgICBlbnVtIHBnX2xldmVsIGxldmVsLCBrdm1fcGZuX3QgcGZu
KQo+ID4gKwkJCQkgICAgIGVudW0gcGdfbGV2ZWwgbGV2ZWwsIHU2NCBtaXJyb3Jfc3B0ZSkKPiA+
ICB7Cj4gPiAgCXN0cnVjdCBrdm1fdGR4ICprdm1fdGR4ID0gdG9fa3ZtX3RkeChrdm0pOwo+ID4g
Kwlrdm1fcGZuX3QgcGZuID0gc3B0ZV90b19wZm4obWlycm9yX3NwdGUpOwo+ID4gIAo+ID4gIAkv
KiBUT0RPOiBoYW5kbGUgbGFyZ2UgcGFnZXMuICovCj4gPiAgCWlmIChLVk1fQlVHX09OKGxldmVs
ICE9IFBHX0xFVkVMXzRLLCBrdm0pKQo+ID4gIAkJcmV0dXJuIC1FSU87Cj4gPiAgCj4gPiArCVdB
Uk5fT05fT05DRSghaXNfc2hhZG93X3ByZXNlbnRfcHRlKG1pcnJvcl9zcHRlKSB8fAo+ID4gKwkJ
ICAgICAobWlycm9yX3NwdGUgJiBWTVhfRVBUX1JXWF9NQVNLKSAhPSBWTVhfRVBUX1JXWF9NQVNL
KTsKPiA+ICsKPiAKPiBOaXQ6wqAKPiAKPiBJIGFtIGEgbGl0dGxlIGJpdCBjb25mdXNlZCBhYm91
dCB3aGVuIHRvIHVzZSBXQVJOX09OX09OQ0UoKSBhbmQKPiBLVk1fQlVHX09OKCkuIDotKQoKVmVy
eSBsb29zZWx5OiBXQVJOIGlmIHRoZXJlJ3MgYSBkZWNlbnQgY2hhbmNlIGNhcnJ5aW5nIG9uIG1p
Z2h0IGJlIGZpbmUsCktWTV9CVUdfT04oKSBpZiB0aGVyZSdzIGEgZ29vZCBjaGFuY2UgY2Fycnlp
bmcgb24gd2lsbCBjcmFzaCB0aGUgaG9zdCBhbmQvb3IKY29ycnVwdCB0aGUgZ3Vlc3QsIGUuZy4g
aWYgS1ZNIHN1c3BlY3RzIGEgaGFyZHdhcmUvVERYLU1vZHVsZSBpc3N1ZS4KCi0tIAprdm0tcmlz
Y3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
