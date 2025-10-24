Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438B4CCF9E0
	for <kvm-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 16:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DcScdOMpAahAihohw7X04/gkhqWfyhrhMrooXNlLea8=; b=09F+1TxVj6fpvIjpCNJ1X+fcvA
	MdiOTj/NkXETnu0FxzaQr2C63UbNVfgJQoIspZgTDGMh5ARO7T1LgePloBJI3m/82LKlygbOnLx6A
	leBbC86TDjckvAfrTjlWEhX5RJHbniMRR1wZi8gdwBRJdF4+qRwdPqY9REdeZPACvYG5QMJ/1mrgp
	Gzs2tpV+BAvPUSJSh081QnI+SGDg2h9EyYIIqib2OfddaqgucSf9Z1ZNsta57z/8lH6oe+rJfFTbF
	6jGJ37EBIElHxAwc+U7Wpnd0eNNQROH3ZB06n/b1FsZRrlbCBqnWINhPMZucJ+pnlP1M8CkQRuwMX
	WAqxzaTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKjY-00000009z9W-1YUE;
	Fri, 24 Oct 2025 16:33:44 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKjW-00000009z7w-0Qht
	for kvm-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 16:33:43 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b6ceba8968dso1603014a12.2
        for <kvm-riscv@lists.infradead.org>; Fri, 24 Oct 2025 09:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761323621; x=1761928421; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XmFbq4MgFLvSavBU+dsE5BY6fpPsL4/gR9QPfUGTSHw=;
        b=Sw7kVbF+AyTonYoOyN6CUt7Zub+uplwL6akryrlBxlkQejD3WF1vK8QxSI+Iubzdy2
         JP9A34w8keMStsLuRz6sA4SVXGHjAOZHYTY6IoRjjjbp6p6RXA3Xi4uBHgYGpF4yklRM
         c4IT/NJXVPmaHOXu0Mf0KQDQJ0k0MYYHBpktBVnHEdZEux6/iY3kes4pz2dh+Q/eNVWw
         /HWvISOTIyFkVUOkQs52iXKpt3hgUnlwKL2F91ZgXZfJ2dI4+6vBiZijw3FmHuj+hzNf
         kgfU7pdtpTS4Px7r7EaCsWsc6OJI60CAVrhL11tT8mPzG6peavzot0SjUqJZzOiYNals
         5PFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761323621; x=1761928421;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XmFbq4MgFLvSavBU+dsE5BY6fpPsL4/gR9QPfUGTSHw=;
        b=rS/HS1gIlKLlneA5Aeb7UGMAI1kPwMWVM5CErAS5DQEdoprphPU9Mtc2SbfdSGHRa4
         6+46rQi+nbSAQLa6yoM3o2vcDnFAJ1OowyZX9XBddhSpnLWV9RXr9bzcXzDUrmy/myPk
         hsEHLzDfILIQOKxTIKq1OmHPCgF1gZ71tyN//8rsOkEmQ1VAa0lYeWHhjY+HGKk0/mIH
         d8a4opn3kbbyDz5u7/Se7kKjkJE2vxxlRSS/9630vcZkCUMlhmpy1C66Cf6blrlCoM/D
         xwwQNTnYL5720fa5HijljOLIarIl4lSD16NgRNtld+3bZ1Zc1lVWrklC8F3WLXUqbKqM
         /gZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdYaBmPdb1v2BeW3nOsGalnLQEB2mEUyi65tIXkW9BRpK8/fU19bsswumQ5JSX8SDElHGN0NtuyCY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxrCqFZ3VxbIojLa2/1yYkbE0Hd41q5KUkhwDM+gGerSTu2JV7l
	RA0KegRy29tIkkUXOhTy7PsV9ryVZSvCuLRTXHThP0l07GoN70XR2WZnOXWCkMbd8VzS1Vk96HK
	VWkpLTQ==
X-Google-Smtp-Source: AGHT+IFeKRRbqSfdPI99mHeasG8LL+kiQGTQFDWiy/7cdPCFgXLMLE3NirNFzhTfpVhc/qoTuLXwCz2Ncvs=
X-Received: from pjot2.prod.google.com ([2002:a17:90a:9502:b0:32f:3fab:c9e7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:244b:b0:30f:7840:2c96
 with SMTP id adf61e73a8af0-334a8629ec6mr34771147637.47.1761323620638; Fri, 24
 Oct 2025 09:33:40 -0700 (PDT)
Date: Fri, 24 Oct 2025 09:33:39 -0700
In-Reply-To: <5dea4a3d-c7b7-48f0-b2d5-7597e0cd5f00@linux.intel.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-14-seanjc@google.com>
 <5dea4a3d-c7b7-48f0-b2d5-7597e0cd5f00@linux.intel.com>
Message-ID: <aPuqYz3ly5a3__mf@google.com>
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
X-CRM114-CacheID: sfid-20251024_093342_140563_67E3BA23 
X-CRM114-Status: GOOD (  14.86  )
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

T24gRnJpLCBPY3QgMjQsIDIwMjUsIEJpbmJpbiBXdSB3cm90ZToKPiAKPiAKPiBPbiAxMC8xNy8y
MDI1IDg6MzIgQU0sIFNlYW4gQ2hyaXN0b3BoZXJzb24gd3JvdGU6Cj4gPiBGb2xkIHRkeF9tZW1f
cGFnZV9yZWNvcmRfcHJlbWFwX2NudCgpIGludG8gdGR4X3NlcHRfc2V0X3ByaXZhdGVfc3B0ZSgp
IGFzCj4gPiBwcm92aWRpbmcgYSBvbmUtb2ZmIGhlbHBlciBmb3IgZWZmZWN0aXZlbHkgdGhyZWUg
bGluZXMgb2YgY29kZSBpcyBhdCBiZXN0IGEKPiA+IHdhc2gsIGFuZCBzcGxpdHRpbmcgdGhlIGNv
ZGUgbWFrZXMgdGhlIGNvbW1lbnQgZm9yIHNtcF9ybWIoKSAgX2V4dHJlbWVseV8KPiA+IGNvbmZ1
c2luZyBhcyB0aGUgY29tbWVudCB0YWxrcyBhYm91dCByZWFkaW5nIGt2bS0+YXJjaC5wcmVfZmF1
bHRfYWxsb3dlZAo+ID4gYmVmb3JlIGt2bV90ZHgtPnN0YXRlLCBidXQgdGhlIGltbWVkaWF0ZWx5
IHZpc2libGUgY29kZSBkb2VzIHRoZSBleGFjdAo+ID4gb3Bwb3NpdGUuCj4gPiAKPiA+IE9wcG9y
dHVuaXN0aWNhbGx5IHJld3JpdGUgdGhlIGNvbW1lbnRzIHRvIG1vcmUgZXhwbGljaXRseSBleHBs
YWluIHdobyBpcwo+ID4gY2hlY2tpbmcgd2hhdCwgYXMgd2VsbCBhcyBfd2h5XyB0aGUgb3JkZXJp
bmcgbWF0dGVycy4KPiA+IAo+ID4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCj4gPiAK
PiA+IFJldmlld2VkLWJ5OiBSaWNrIEVkZ2Vjb21iZSA8cmljay5wLmVkZ2Vjb21iZUBpbnRlbC5j
b20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xl
LmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogQmluYmluIFd1IDxiaW5iaW4ud3VAbGludXguaW50ZWwu
Y29tPgo+IAo+IE9uZSBuaXQgYmVsb3cuCj4gCj4gWy4uLl0KPiA+ICsJLyoKPiA+ICsJICogSWYg
dGhlIFREIGlzbid0IGZpbmFsaXplZC9ydW5uYWJsZSwgdGhlbiB1c2Vyc3BhY2UgaXMgaW5pdGlh
bGl6aW5nCj4gPiArCSAqIHRoZSBWTSBpbWFnZSB2aWEgS1ZNX1REWF9JTklUX01FTV9SRUdJT04u
ICBJbmNyZW1lbnQgdGhlIG51bWJlciBvZgo+ID4gKwkgKiBwYWdlcyB0aGF0IG5lZWQgdG8gYmUg
bWFwcGVkIGFuZCBpbml0aWFsaXplZCB2aWEgVERILk1FTS5QQUdFLkFERC4KPiA+ICsJICogS1ZN
X1REWF9GSU5BTElaRV9WTSBjaGVja3MgdGhlIGNvdW50ZXIgdG8gZW5zdXJlIGFsbCBtYXBwZWQg
cGFnZXMKPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoF4KPiDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBOaXQ6IElzIHByZS1tYXBwZWQgYmV0dGVyPwoKWWVhaCwgdXBkYXRlZCAo
YW5kIHRoZW4gaXQgZ2V0cyBkZWxldGVkIGEgZmV3IGNvbW1pdHMgbGF0ZXIgOi0pICkuCgotLSAK
a3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
