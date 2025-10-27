Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277F8CCF9EE
	for <kvm-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 18:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Owj5CCn3c5rCvXqGyRhngx9bYmf6UT3ZnFEy1LJWf9I=; b=A4T1ZTghE/XMvFGKQj1bBKjW+K
	BqPAOwWdTWz8QwuuHtidTpft6+wWPlbXFrC+npXzCBvnoLTPC4yJuH0v2zgPTIXrd1OaRymanhaEX
	a++pCbyqUHCSY6lCfQOU+OrzYu8tDog7dKOiHIKsafhj49zZpbLGNOJNUTN6zaM4JU1fnZQotwM9z
	fLMEiMq8jRDd+9+niQ7VNWjsNENmh+pZTc6xX2Ce3dqrvFPRoE6Yemy9lAWdQdgXEw32tX0vqs7Ot
	bFDJFGgD34L8nLU7DEeoqqgxgnUmWXjZsIx9C+KwBVvdNm34X9gra8e+Lxmyx8vrOnrEOBAH8BvO9
	zvnuV3ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRgH-0000000EWIu-3UmW;
	Mon, 27 Oct 2025 18:10:57 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRgD-0000000EWH0-1izQ
	for kvm-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 18:10:56 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-33d8970ae47so4450847a91.1
        for <kvm-riscv@lists.infradead.org>; Mon, 27 Oct 2025 11:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761588652; x=1762193452; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bO0HNahSQ0zli7kg4xL2kKu/rPaiGOzpKxwGHDcn9b4=;
        b=1Og0Ub/H7o2Birmhj8bbqS/728j3jMYI0HMQFkTpgNnPYKOONW3q/lbNJt5iNz4tl7
         J2hsqtBUOBSUvWfiXThaG/UIVP6XDFQeslR1ZmrVBPOp7h7Dg/uE3Sl/8vxFU+vE6sWe
         iP2ssH1fHNxNsoNLKiNa6/X5Nr0ptoNLOvZmlL90BMcZqzBHMUunYixFohGUWovR2e5X
         o5KUCO1N3wxwbxPYDG/qZNF4TBvnzHjN/9kawGmCRGZq6kfoeugPQmTSLGODWKbsi54m
         WHvUNsWUKFgFca7E43zTmG8ERYnTc4Cv825ZxnHZjih+ct43aT+/dpENQ8jBDnZDWp2U
         tXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761588652; x=1762193452;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bO0HNahSQ0zli7kg4xL2kKu/rPaiGOzpKxwGHDcn9b4=;
        b=i5n3XipuxlPDUKBn7EbOmF1GF+ButquboBMzrQ9r92NSDQB4xSq4S0AdKQGm9B/++6
         O0ISyLPtHle1xO/2uiOTyntRVc0buP3kgAE+t/g6ZSP+L8CcDWTvB/XduMFh1EC2Gv1h
         S7iSpmlRNj2AgSg80iJgQLvDFMMIUO9xeUixeXfj+gR0zqB3Iio2CeriISFNdb6HgfS9
         6foQdNi4gJ/gdRgp7oK37X7OCjvuB9YO6zFoDegN38ktFV3RoUCc+yebxlhoYpt85Y6r
         /ew7DmXMKoEUEsu0Nq8WUUXKkYq8EeyEzyTlmpADgWdOIZqPIK0cYpV6xFzmFClyq/+8
         +eaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB8l9WCBfjMzXy9bjc5J4oQ1aBZ8Fh70N/H6XSkrlbxZFWRtWrPV5NzDMaRsxeRiIUy+fNjPiwR9A=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7da6VewdkUJmTr77vdVFwn00g0jMiVIASaTBBFh0kNQ7sMmfR
	M0g38EVIiuRCQfySapdfsu6Vc06rwolDcRiDsim5XXCipaVTQAGFWbjM06ViWqG9qVnBwZd4jtT
	6Jl+tPA==
X-Google-Smtp-Source: AGHT+IFYM0pQ56UGeUzsOnJj3+Ow3Uhx6HMXZ6WjKUcRvfRsyB3bsUItowqHfr7m0JixZWoiV89rDaaCMlA=
X-Received: from pjbrs15.prod.google.com ([2002:a17:90b:2b8f:b0:33b:51fe:1a73])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4f81:b0:32e:52aa:3973
 with SMTP id 98e67ed59e1d1-340279e5fc5mr862252a91.8.1761588651707; Mon, 27
 Oct 2025 11:10:51 -0700 (PDT)
Date: Mon, 27 Oct 2025 11:10:50 -0700
In-Reply-To: <77d8a0d9541ce3fc2b2c76b58add50d152b52e39.camel@intel.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-25-seanjc@google.com>
 <aPtOtzGLigbY0Vqw@yzhao56-desk.sh.intel.com> <aPuv8F8iDp3SLb9q@google.com>
 <aP86sdBZxXm5I17f@yzhao56-desk.sh.intel.com> <77d8a0d9541ce3fc2b2c76b58add50d152b52e39.camel@intel.com>
Message-ID: <aP-1qlTkmFUgTld-@google.com>
Subject: Re: [PATCH v3 24/25] KVM: TDX: Guard VM state transitions with "all"
 the locks
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: Yan Y Zhao <yan.y.zhao@intel.com>, 
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"x86@kernel.org" <x86@kernel.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Vishal Annapurve <vannapurve@google.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, 
	"maobibo@loongson.cn" <maobibo@loongson.cn>, "maz@kernel.org" <maz@kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "anup@brainfault.org" <anup@brainfault.org>, 
	Kai Huang <kai.huang@intel.com>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, "zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Ira Weiny <ira.weiny@intel.com>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "kas@kernel.org" <kas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_111053_459478_62F9330D 
X-CRM114-Status: GOOD (  21.54  )
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

T24gTW9uLCBPY3QgMjcsIDIwMjUsIFJpY2sgUCBFZGdlY29tYmUgd3JvdGU6Cj4gT24gTW9uLCAy
MDI1LTEwLTI3IGF0IDE3OjI2ICswODAwLCBZYW4gWmhhbyB3cm90ZToKPiA+ID4gVWdoLCBJJ2Qg
cmF0aGVyIG5vdD/CoCBSZWZyZXNoIG1lLCB3aGF0J3MgdGhlIHN0b3J5IHdpdGggInYxIj/CoCBB
cmUgd2Ugbm93IG9uCj4gPiA+IHYyPwo+ID4gTm8uLi4gV2UgYXJlIG5vdyBvbiB2MS4KPiA+IEFz
IGluIFsxXSwgSSBmb3VuZCB0aGF0IFREWCBtb2R1bGUgY2hhbmdlZCBTRUFNQ0FMTCBUREhfVlBf
SU5JVCBiZWhhdmlvciB0bwo+ID4gcmVxdWlyZSBleGNsdXNpdmUgbG9jayBvbiByZXNvdXJjZSBU
RFIgd2hlbiBsZWFmX29wY29kZS52ZXJzaW9uID4gMC4KPiA+IAo+ID4gVGhlcmVmb3JlLCB3ZSBt
b3ZlZCBLVk1fVERYX0lOSVRfVkNQVSB0byB0ZHhfdmNwdV91bmxvY2tlZF9pb2N0bCgpIGluIHBh
dGNoCj4gPiAyMi4KPiA+IAo+ID4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9hTGEz
NFFDSkNYR0xrJTJGZmxAeXpoYW81Ni1kZXNrLnNoLmludGVsLmNvbS8KPiAKPiBMb29raW5nIGF0
IHRoZSBQREYgZG9jcywgVERSIGV4Y2x1c2l2ZSBsb2NraW5nIGluIHZlcnNpb24gPT0gMSBpcyBj
YWxsZWQgb3V0IGF0Cj4gbGVhc3QgYmFjayB0byB0aGUgb2xkZXN0IEFCSSBkb2NzIEkgaGF2ZSAo
TWFyY2ggMjAyNCkuIE5vdCBzdXJlIGFib3V0IHRoZQo+IGFzc2VydGlvbiB0aGF0IHRoZSBiZWhh
dmlvciBjaGFuZ2VkLCBidXQgaWYgaW5kZWVkIHRoaXMgd2FzIGRvY3VtZW50ZWQsIGl0J3MgYQo+
IGxpdHRsZSBiaXQgb3VyIGJhZC4gV2UgbWlnaHQgY29uc2lkZXIgYmVpbmcgZmxleGlibGUgYXJv
dW5kIGNhbGxpbmcgaXQgYSBURFggQUJJCj4gYnJlYWs/Cj4gCj4gU2VhbiwgY2FuIHlvdSBlbGFi
b3JhdGUgd2h5IHRha2luZyBtbXVfbG9jayBpcyBvYmplY3Rpb25hYmxlIGhlcmUsIHRob3VnaD8K
Ckl0J3Mgbm90LCBJIHdhcyBqdXN0IGhvcGluZyB3ZSBjb3VsZCBhdm9pZCB5ZXQgbW9yZSBjb21w
bGV4aXR5LgoKQXNzdW1pbmcgd2UgZG8gaW5kZWVkIG5lZWQgdG8gdGFrZSBtbXVfbG9jaywgY2Fu
IHlvdSBzZW5kIGEgcGF0Y2ggdGhhdCBhcHBsaWVzCm9uIHRvcD8gIEknbSBub3QgcGxhbm5pbmcg
b24gc2VuZGluZyBhbnkgb2YgdGhpcyB0byBzdGFibGVALCBzbyBJIGRvbid0IHNlZSBhbnkKcmVh
c29uIHRvIHRyeSBhbmQganVnZ2xlIHBhdGNoZXMgYXJvdW5kLgoKPiBOb3RlLCBteXNlbGYgKGFu
ZCBJIHRoaW5rIFlhbj8pIGRldGVybWluZWQgdGhlIGxvY2tpbmcgYnkgZXhhbWluaW5nIFREWCBt
b2R1bGUKPiBzb3VyY2UuIEZvciBteXNlbGYsIGl0J3MgcG9zc2libGUgSSBtaXNyZWFkIHRoZSBs
b2NraW5nIG9yaWdpbmFsbHkuCj4gCj4gQWxzbywgSSdtIG5vdCBzdXJlIGFib3V0IHN3aXRjaGlu
ZyBnZWFycyBhdCB0aGlzIHBvaW50LCBidXQgaXQgbWFrZXMgbWUgd29uZGVyCj4gYWJvdXQgdGhl
IHByZXZpb3VzbHkgZGlzY3Vzc2VkIG9wdGlvbiBvZiB0cnlpbmcgdG8ganVzdCBkdXBsaWNhdGUg
dGhlIFREWCBsb2Nrcwo+IG9uIHRoZSBrZXJuZWwgc2lkZS4KClBsZWFzZSBuby4gIEF0IGJlc3Qg
dGhhdCB3aWxsIHlpZWxkIGEgcGlsZSBvZiBlZmZlY3RpdmVseSB1c2VsZXNzIGNvZGUuICBBdCB3
b3JzdCwKaXQgd2lsbCBtYWtlIHVzIGxhenkgYW5kIGxlYWQgdG8gcmVhbCBidWdzIGJlY2F1c2Ug
d2UgZG9uJ3QgcHJvcGVyeSBndWFyZCB0aGUgKktWTSoKZmxvd3MgdGhhdCBuZWVkIGV4Y2x1c2l2
aXR5IHJlbGF0aXZlIHRvIHdoYXQgaXMgZ29pbmcgb24gaW4gdGhlIFREWC1Nb2R1bGUuCgo+IE9y
IHBlcmhhcHMgbWFrZSBzb21lIGtpbmQgb2YgZGVidWcgdGltZSBsb2NrZGVwIHR5cGUgdGhpbmcg
dG8gZG9jdW1lbnQvY2hlY2sKPiB0aGUgYXNzdW1wdGlvbnMgaW4gdGhlIGtlcm5lbC4gU29tZXRo
aW5nIGFsb25nIHRoZSBsaW5lcyBvZiB0aGlzIHBhdGNoLCBidXQKPiB0byBtYXAgdGhlIFREWCBs
b2NrcyB0byBLVk0gbG9ja3Mgb3Igc29tZXRoaW5nLiBBcyB3ZSBhZGQgbW9yZSB0aGluZ3MgKERQ
QU1ULAo+IGV0YyksIGl0IGRvZXNuJ3Qgc2VlbSBsaWtlIHRoZSBURFggbG9ja2luZyBpcyBnZXR0
aW5nIHRhbWVyLi4uCgpIbW0sIEkgbGlrZSB0aGUgaWRlYSwgYnV0IGFjdHVhbGx5IGdldHRpbmcg
bWVhbmluZ2Z1bCBjb3ZlcmFnZSBjb3VsZCBiZSBxdWl0ZQpkaWZmaWN1bHQuCgotLSAKa3ZtLXJp
c2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
