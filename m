Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689ACCCF9E0
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 00:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Ons4prTbERoE+Ag/ESMWdgFcItGWOJs/zwlH36/PkY8=; b=pj4Beadq//h4/6Vx3vvT0c8V+d
	70nyJx+d/ty0JGXVB64ElAtkts/BqyXrwhntcimG5kX/xcdo0pQmau7bqfpxmcjB+7rEoGftPEsyN
	Aji95EccPXvZggSJMqWGkGNXQhmZCS5iqhdKAIVAeDDcDdzsk9Mjx6ifqxS+VxCB7LU6pbJfBL/+u
	6d2kHMI3XnHnCkD3eaUerZcp4iGnd1t2BEIWc1lOwO6x1uIcCpwaMm78LUk5vBttvW+GUk48cQeuF
	FXtGfwC4U/vRLl7N4bgxD5/BSLSG/VDOx328t4Pq6Ob+NESCp5QS9DA/XHEHpeplKiDVvvHLOg9h0
	6imZ4xKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXav-0000000EzTP-0ihV;
	Tue, 28 Oct 2025 00:29:49 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXar-0000000EzQg-33Va
	for kvm-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 00:29:47 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-32ec69d22b2so4503042a91.1
        for <kvm-riscv@lists.infradead.org>; Mon, 27 Oct 2025 17:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761611384; x=1762216184; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3fZq3tbinLN9iV6tR9wh+L1TcJJLRbds3pWQbE4SVPQ=;
        b=W2KTpxdBog6wEgizqYtCyy8IeBp9EwKpxA+gvoIg0oZivMIshahawOfTZ7aTsE5+yO
         y7K4K8jzpPg3Qag70h9+DyrlI5MQsNW0V3tHmCCvSMnc3bo9qAFcJtc24yHdWluh4cVT
         GV3m5g3cUQQLDReFpOoYRvGquhHQ2heFoY1B6dUIHNNNnRwGUxOIS+0ZygzzvGh050aV
         VUga1gJzwSwhdz15wbJX/RR29vk3u4nUuZLL/Xld3uT+ZdO5gOQ8TLuHuqWL06uChmR8
         tyK83ZDwmle6MtYHvo1diz029+LGOwm2fBJwu40L0qNpb/aC1Y88xiLlT324upXbCr35
         doJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761611384; x=1762216184;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3fZq3tbinLN9iV6tR9wh+L1TcJJLRbds3pWQbE4SVPQ=;
        b=T1RFQ6qwZpcmx9kjiaW5SJonnf1KljutTcCcBO8lS/pRpGebr7ZMG3abr7bCDjA3sC
         Vhq9HCqMKDhU1w22xj5/osYfQICOBJL1nDP+zVslnZPodQ27d6zwJQ5miW44Ee6Rs12N
         2muuv2h7TygsyS/wTMAn9xus0udtLfKyTIE3gUm8ygq9mcqtZmEzpZ0qBx6rlz3nxRBF
         40CPfWMIuuEdmAJrA7fBpegLa31zq/Nphi/XXFZcV1UjE1UsgFZY9jtqyy4oh5lNB1ad
         BkHhv+Ej2ehIf1Idv8PPIWFM/GIcm7ZBifJqewuEH1akNlMUpkSSldbMT8OcIG63edUD
         rwNA==
X-Forwarded-Encrypted: i=1; AJvYcCWdUr1Q77BDLo9pPBRzXJt65lvCdSdijb/IlaXxvxx+ZSR/Ew2/DcIIDhNUuCIr/4QUn3kpsBFCNy0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzCgo4reGALedJRlNjiUVsqc5EO2q+fxVGKNHeMZt9UwNe8Uttk
	bEavSXXqwyniig3aKaoweEoikK5AF77wZ2G8AeNboBWcxH78fIxBf60FuSj5tf7Aj3adofg/q+S
	9ahBYYw==
X-Google-Smtp-Source: AGHT+IEcbPffJX+DPzKHtANj5YoID2qTNS+wCvJIhOFTengBDdmvUTitjaF5SaOhKDAJ4Iu3BAJZiOrVVlg=
X-Received: from pjqc14.prod.google.com ([2002:a17:90a:a60e:b0:33b:51fe:1a77])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d0f:b0:33e:30e8:81cb
 with SMTP id 98e67ed59e1d1-34027a0775bmr1898674a91.13.1761611384405; Mon, 27
 Oct 2025 17:29:44 -0700 (PDT)
Date: Mon, 27 Oct 2025 17:29:42 -0700
In-Reply-To: <59ae9957-88a8-4777-9bd2-196e8b4eb8ac@linux.intel.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-14-seanjc@google.com>
 <5dea4a3d-c7b7-48f0-b2d5-7597e0cd5f00@linux.intel.com> <aPuqYz3ly5a3__mf@google.com>
 <59ae9957-88a8-4777-9bd2-196e8b4eb8ac@linux.intel.com>
Message-ID: <aQAOdiSUktmAJKsw@google.com>
Subject: Re: [PATCH v3 13/25] KVM: TDX: Fold tdx_mem_page_record_premap_cnt()
 into its sole caller
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_172945_777336_037A77AF 
X-CRM114-Status: GOOD (  19.42  )
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

T24gTW9uLCBPY3QgMjcsIDIwMjUsIEJpbmJpbiBXdSB3cm90ZToKPiAKPiAKPiBPbiAxMC8yNS8y
MDI1IDEyOjMzIEFNLCBTZWFuIENocmlzdG9waGVyc29uIHdyb3RlOgo+ID4gT24gRnJpLCBPY3Qg
MjQsIDIwMjUsIEJpbmJpbiBXdSB3cm90ZToKPiA+ID4gCj4gPiA+IE9uIDEwLzE3LzIwMjUgODoz
MiBBTSwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToKPiA+ID4gPiBGb2xkIHRkeF9tZW1fcGFn
ZV9yZWNvcmRfcHJlbWFwX2NudCgpIGludG8gdGR4X3NlcHRfc2V0X3ByaXZhdGVfc3B0ZSgpIGFz
Cj4gPiA+ID4gcHJvdmlkaW5nIGEgb25lLW9mZiBoZWxwZXIgZm9yIGVmZmVjdGl2ZWx5IHRocmVl
IGxpbmVzIG9mIGNvZGUgaXMgYXQgYmVzdCBhCj4gPiA+ID4gd2FzaCwgYW5kIHNwbGl0dGluZyB0
aGUgY29kZSBtYWtlcyB0aGUgY29tbWVudCBmb3Igc21wX3JtYigpICBfZXh0cmVtZWx5Xwo+ID4g
PiA+IGNvbmZ1c2luZyBhcyB0aGUgY29tbWVudCB0YWxrcyBhYm91dCByZWFkaW5nIGt2bS0+YXJj
aC5wcmVfZmF1bHRfYWxsb3dlZAo+ID4gPiA+IGJlZm9yZSBrdm1fdGR4LT5zdGF0ZSwgYnV0IHRo
ZSBpbW1lZGlhdGVseSB2aXNpYmxlIGNvZGUgZG9lcyB0aGUgZXhhY3QKPiA+ID4gPiBvcHBvc2l0
ZS4KPiA+ID4gPiAKPiA+ID4gPiBPcHBvcnR1bmlzdGljYWxseSByZXdyaXRlIHRoZSBjb21tZW50
cyB0byBtb3JlIGV4cGxpY2l0bHkgZXhwbGFpbiB3aG8gaXMKPiA+ID4gPiBjaGVja2luZyB3aGF0
LCBhcyB3ZWxsIGFzIF93aHlfIHRoZSBvcmRlcmluZyBtYXR0ZXJzLgo+ID4gPiA+IAo+ID4gPiA+
IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+ID4gPiA+IAo+ID4gPiA+IFJldmlld2Vk
LWJ5OiBSaWNrIEVkZ2Vjb21iZSA8cmljay5wLmVkZ2Vjb21iZUBpbnRlbC5jb20+Cj4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Cj4g
PiA+IFJldmlld2VkLWJ5OiBCaW5iaW4gV3UgPGJpbmJpbi53dUBsaW51eC5pbnRlbC5jb20+Cj4g
PiA+IAo+ID4gPiBPbmUgbml0IGJlbG93Lgo+ID4gPiAKPiA+ID4gWy4uLl0KPiA+ID4gPiArCS8q
Cj4gPiA+ID4gKwkgKiBJZiB0aGUgVEQgaXNuJ3QgZmluYWxpemVkL3J1bm5hYmxlLCB0aGVuIHVz
ZXJzcGFjZSBpcyBpbml0aWFsaXppbmcKPiA+ID4gPiArCSAqIHRoZSBWTSBpbWFnZSB2aWEgS1ZN
X1REWF9JTklUX01FTV9SRUdJT04uICBJbmNyZW1lbnQgdGhlIG51bWJlciBvZgo+ID4gPiA+ICsJ
ICogcGFnZXMgdGhhdCBuZWVkIHRvIGJlIG1hcHBlZCBhbmQgaW5pdGlhbGl6ZWQgdmlhIFRESC5N
RU0uUEFHRS5BREQuCj4gPiA+ID4gKwkgKiBLVk1fVERYX0ZJTkFMSVpFX1ZNIGNoZWNrcyB0aGUg
Y291bnRlciB0byBlbnN1cmUgYWxsIG1hcHBlZCBwYWdlcwo+ID4gPiAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBeCj4gPiA+ICDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBOaXQ6
IElzIHByZS1tYXBwZWQgYmV0dGVyPwo+ID4gWWVhaCwgdXBkYXRlZCAoYW5kIHRoZW4gaXQgZ2V0
cyBkZWxldGVkIGEgZmV3IGNvbW1pdHMgbGF0ZXIgOi0pICkuCj4gT2gsIHJpZ2h0LCBucl9wcmVt
YXBwZWQgd2lsbCBiZSBkcm9wcGVkIGxhdGVyLgo+IAo+IFNpbmNlIHRoZSB3aG9sZSBucl9wcmVt
YXBwZWQgd2lsbCBiZSBkcm9wcGVkLCBkbyB3ZSBzdGlsbCBuZWVkIGEgY2xlYW51cCBwYXRjaAo+
IGxpa2UgcGF0Y2ggMTIgd2hpY2ggd2lsbCBiZSBkcm9wcGVkIGZpbmFsbHk/CgpXZSBkb24ndCBz
dHJpY3RseSAibmVlZCIgdGhlIGNsZWFudXBzLCBidXQgSU1PIGludGVybWVkaWF0ZSBjbGVhbnVw
cyBhcmUgb2Z0ZW4Kd29ydGggZG9pbmcgZXZlbiBpZiB0aGV5IGdldCB0aHJvd24gYXdheSwgc29v
IHRoYXQgdGhlIGNvZGUgaXMgaW4gYSAoaG9wZWZ1bGx5KQpiZXR0ZXIgc3RhdGUgd2hlbiB0aGUg
ImJpZyIgZnVuY3Rpb25hbCBjaGFuZ2UgY29tZXMgYWxvbmcuICBJLmUuIGlmIGNvZGUgJ1gnIGlz
CmVhc2llciB0byB1bmRlcnN0YW5kIHRoYW4gY29kZSAnWScsIHRoZW4gdGhlb3JldGljYWxseS9o
b3BlZnVsbHkgWD0+WiBpcyBhbHNvCmVhc2llciB0byB1bmRlcnN0YW5kIHRoYW4gWT0+Wi4KCi0t
IAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
