Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A6EC19F2F
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 09:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0p6du6c1K3gtfSw8ZgT5iK2WxkFwqbVd6lAt99W7Ioc=; b=LLFaiO7+bSX3gp
	s1mI0P3T8CeByZq6Y6ewVfI6bvceiQnDRRA5F9WYsT6HeXCqbixReTjOcSKhMVVRqlLQM1Nrxok9o
	dnx5dtNpN+qQ1lJyY8uprAf/GZF/eDS+fPBEN50Nh+1SYLIhpZKvYZ9IRANif4P7KLM6jUbylSqDt
	eXKxfokrL16DhId6upbjLdbfIG0oFDNwKoG/5KA1pSm2AFHYssICuWa/dz4DRBMArHCFnOMWfKEbh
	59VvSNUIUbtfNfZmvPLle8zxKgT6j2xMAoWQ1WtsTd+Fhww8KLX3f4h9k/0XDqZf4CFgqb4/KsJ+b
	tJahi9ZLtnQu+8jNMZaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDdF-0000000348a-1qoO;
	Wed, 26 Feb 2025 09:23:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDYy-000000033Ji-1oiP
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 09:18:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740561523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0MIbia0vRPyl/EASI4bbBzkpXlN9D9cFmNZ+w8QhjMs=;
	b=NfFHzAIXISkgCm3u6qfcMrCAga246qeMtuEY3V4zFReCSv9Y9mLZuN1YYATNLjvFxXD9h9
	ddHBnlx45mCgqZKt1BUmmmgfMkSbHDLeAF2cu4OgrtRQhbqQsqNpTDjBJtHBa5htorvCtC
	AGCFED36x9lp8nLUoLL8dCVNU1KADtE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-H_u9EwmMMV6UUjnyj464ZQ-1; Wed, 26 Feb 2025 04:18:39 -0500
X-MC-Unique: H_u9EwmMMV6UUjnyj464ZQ-1
X-Mimecast-MFC-AGG-ID: H_u9EwmMMV6UUjnyj464ZQ_1740561518
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-390de58dc4eso73521f8f.0
        for <kvm-riscv@lists.infradead.org>; Wed, 26 Feb 2025 01:18:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740561518; x=1741166318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0MIbia0vRPyl/EASI4bbBzkpXlN9D9cFmNZ+w8QhjMs=;
        b=lQOqVyHulEXKwcFHdLeg2l/BxZah/lwNdWdDcK19+I1rlf6YtzftPuQ9y5VThsgKZ9
         tYURvPsrkpGkQqiT+ZDEeIVjFjA21v7US4Z9ziPRoPJ8hpPkkCIPgHoyj2ONxXnb49+1
         kBboHWVjJqTdszRBwFZgonJxGuLqRKbOSdYcsK1/NNEf8Hc1ElYKrVG5jHm/QHC+8V03
         C8VpwRyI6WvCkrhf5FhZMOVBFnhxLbBkgDhnGj3jwEVT4LCwl7I2sXFfmDjo0+kSBZey
         Q3sjeDAg4OzEGsIqL94krnp7KPuxkgyE6GlLJzfeq5nnC5ncSBvAs1/xjP5NeVirUiUF
         PQ/g==
X-Forwarded-Encrypted: i=1; AJvYcCVKboQxV2mketGRm/nAD+APKQr/Q5JJzphlHipVVTEI6KH7l9bu+KV2SykXMfgA5qEuiV7mzoznlqw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9UKUIDnNQh6U1fiqHCGwKBDZ9wl1/ixs72pVXByPUGo+mKy8x
	o/1mZZKPQAxcctwevSjvJEp94x/7DBA0vpPGFJ++tW4Q8jIInbFjdMd/4XWp6rdIh1OqAd+pifc
	0AnE/94JyxPRPHax7cB7qp89J1hDyUcUYhQRd8KqMXWhWXHzTb1ehnrjAJ4ZIZmnKMBk9cOLCb3
	r7coTk0nEpfTEGyuoNL8YafTU8pVukJM0XpViPMA==
X-Gm-Gg: ASbGncuDzqU992xBsP3GFuVrhpmzanzLMvBhY0G6iPNRM7Vq3CQoTXpx/fwAchuyPJW
	GDYODnO05Dbd0cJWGeyLn5FP/+nUetMp0dLRiSO9UlcfGcLkDsRxK9oHjNU7lIZsrIs6Vj5DT2Q
	==
X-Received: by 2002:a5d:47af:0:b0:390:d61c:c777 with SMTP id ffacd0b85a97d-390d61cc85fmr1296779f8f.46.1740561517839;
        Wed, 26 Feb 2025 01:18:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGM8QJcltKK3icbvaiTIyjEom27+uMjjmS3V6slM8kbmQaHs57lufLQIp1ODz/r9AND77qyPMNyl+BQOe7Hd40=
X-Received: by 2002:a5d:47af:0:b0:390:d61c:c777 with SMTP id
 ffacd0b85a97d-390d61cc85fmr1296733f8f.46.1740561517436; Wed, 26 Feb 2025
 01:18:37 -0800 (PST)
MIME-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com> <20250224235542.2562848-2-seanjc@google.com>
 <6475f9c7-304a-4e0b-8000-3dc5c8e718e9@redhat.com> <Z75f9GuA9NfKo37c@google.com>
In-Reply-To: <Z75f9GuA9NfKo37c@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 26 Feb 2025 10:18:26 +0100
X-Gm-Features: AQ5f1JqpfKleIgYhNDBuhYOTkE7mUvo6hlKxjC4ts72PAS8Q4WmxhhjJCWdlkGA
Message-ID: <CABgObfZWqBm089dkOpWwX-d6Bgp84zP_0Gow4ow7ZKHov=8oxg@mail.gmail.com>
Subject: Re: [PATCH 1/7] KVM: x86: Free vCPUs before freeing VM state
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Aaron Lewis <aaronlewis@google.com>, 
	Jim Mattson <jmattson@google.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5NH4SXSDjucmbPpooDjfSCq9Dccc6JkXPxHyxiPCNN8_1740561518
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_011844_538867_8D0763A4 
X-CRM114-Status: GOOD (  13.96  )
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

T24gV2VkLCBGZWIgMjYsIDIwMjUgYXQgMToyN+KAr0FNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgRmViIDI2LCAyMDI1LCBQYW9sbyBC
b256aW5pIHdyb3RlOgo+ID4gT24gMi8yNS8yNSAwMDo1NSwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3
cm90ZToKPiA+ID4gRnJlZSB2Q1BVcyBiZWZvcmUgZnJlZWluZyBhbnkgVk0gc3RhdGUsIGFzIGJv
dGggU1ZNIGFuZCBWTVggbWF5IGFjY2Vzcwo+ID4gPiBWTSBzdGF0ZSB3aGVuICJmcmVlaW5nIiBh
IHZDUFUgdGhhdCBpcyBjdXJyZW50bHkgImluIiBMMiwgaS5lLiB0aGF0IG5lZWRzCj4gPiA+IHRv
IGJlIGtpY2tlZCBvdXQgb2YgbmVzdGVkIGd1ZXN0IG1vZGUuCj4gPiA+Cj4gPiA+IENvbW1pdCA2
ZmNlZTAzZGY2YTEgKCJLVk06IHg4NjogYXZvaWQgbG9hZGluZyBhIHZDUFUgYWZ0ZXIgLnZtX2Rl
c3Ryb3kgd2FzCj4gPiA+IGNhbGxlZCIpIHBhcnRpYWxseSBmaXhlZCB0aGUgaXNzdWUsIGJ1dCBm
b3IgdW5rbm93biByZWFzb25zIG9ubHkgbW92ZWQgdGhlCj4gPiA+IE1NVSB1bmxvYWRpbmcgYmVm
b3JlIFZNIGRlc3RydWN0aW9uLiAgQ29tcGxldGUgdGhlIGNoYW5nZSwgYW5kIGZyZWUgYWxsCj4g
PiA+IHZDUFUgc3RhdGUgcHJpb3IgdG8gZGVzdHJveWluZyBWTSBzdGF0ZSwgYXMgblZNWCBhY2Nl
c3NlcyBldmVuIG1vcmUgc3RhdGUKPiA+ID4gdGhhbiBuU1ZNLgo+ID4KPiA+IEkgYXBwbGllZCB0
aGlzIHRvIGt2bS1jb2NvLXF1ZXVlLCBJIHdpbGwgcGxhY2UgaXQgaW4ga3ZtL21hc3RlciB0b28g
dW5sZXNzCj4gPiB5b3Ugc2hvdXQuCj4KPiBEZXBlbmRzIG9uIHdoYXQgInRoaXMiIGlzIDotKQo+
Cj4gTXkgcGxhbi9ob3BlIGlzIHRvIGxhbmQgcGF0Y2hlcyAxIGFuZCAyIGluIDYuMTQsIGkuZS4g
aW4ga3ZtL21hc3RlcgoKSSBtZWFudCBvbmx5IDEsIGJ1dCBpZiB5b3Ugd2FudCB0byBoYXZlIDIg
YXMgd2VsbCB0aGVuIHRoYXQncyBmaW5lIHRvby4KCkFzIHRvIGt2bS1jb2NvLXF1ZXVlLCBiYXNl
ZCBvbiBZYW4ncyByZXBseSBJIGhhdmUgMSAob2YgY291cnNlKSwgNCBhbmQKYW4gZXh0cmEgcGF0
Y2ggdG8gbW92ZSBrdm1feDg2X2NhbGwodm1fZGVzdHJveSkgYXQgdGhlIHZlcnkgZW5kIG9mCmt2
bV9hcmNoX2Rlc3Ryb3lfdm07IEknbGwgcG9zdCBldmVyeXRoaW5nIGFzIHNvb24gYXMgSSBmaW5p
c2ggYnVpbGRpbmcKYW5kIHRlc3RpbmcuCgpQYW9sbwoKPiByZXN0IGFyZSBmaXJtbHkgNi4xNSBJ
TU8uICBBbmQgYmFzZWQgb24gWWFuJ3MgZmVlZGJhY2ssIEknbSBwbGFubmluZyBvbiBhZGRpbmcg
YQo+IGZldyBtb3JlIGNsZWFudXBzICh0aG91Z2ggSSB0aGluayB0aGV5J3JlIGZ1bGx5IGFkZGl0
aXZlLCBpLmUuIGNhbiBnbyBvbiB0b3ApLgo+CgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QK
a3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
