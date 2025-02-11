Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2456C0219B
	for <kvm-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 10:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cv8g4oeYngXHyXTLLlKcx13aHZ2RkbpbZitNMA5kHqw=; b=H7e3MqPRbsuBde
	9/cp7ppBVAtvMlQCn0d2nW9Ub5irMBKO5gRJngxCF03BznfWdeF9aJZxWkyIxi3pylsIIlI6A7IGE
	UtXnEsHqQsHksysOYCK8QdGKMgqJJCRse7oS4TINXRfrQgPlzKWO47PhxWhuU5DU/ucp8jmiUBQuX
	P6MfcmXthig1Dwt/RAKY5bZsCQHY2Ch3lwGjPZ+lEMRVpE8mKWcqX67Tg10g6YahC1kawZCU29ZJt
	DE4Ccn6jcVo+8uhK4XoOnvvZvKwAS2/n1HwYERkvEL4zW6yO9u3z4hKkLUsXXlVbVr5liiCvxI/ok
	NCVkgcmtpGTATZiYnfhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thnuM-00000003QvP-1Mx6;
	Tue, 11 Feb 2025 10:54:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thnh9-00000003NyB-1mIJ
	for kvm-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 10:40:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739270445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=btgsMkB+KatSBhW2xvQ/HbfeImWKcXqMZC5wzTOtkqg=;
	b=ErD4E/RU1arsLGEYQdfZ5+w7z/KhLH5ynMEcM7nlnSg49gRVbMJ5bVJLxhKKzUhWjPdQ31
	qA4+ym/KEkSn2Upjl9Jg0XI//z6gsZ9F15PM5BEPR3eRih1QPpKa53z1/4P7S7QFtqcCdo
	JnUDqPkyb5rr3n4YS7qtP7byxiDV1z0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-XQxSLPiEPASvXHnfbQbLMA-1; Tue, 11 Feb 2025 05:40:43 -0500
X-MC-Unique: XQxSLPiEPASvXHnfbQbLMA-1
X-Mimecast-MFC-AGG-ID: XQxSLPiEPASvXHnfbQbLMA_1739270443
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43933eb7e1dso19657315e9.2
        for <kvm-riscv@lists.infradead.org>; Tue, 11 Feb 2025 02:40:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739270443; x=1739875243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=btgsMkB+KatSBhW2xvQ/HbfeImWKcXqMZC5wzTOtkqg=;
        b=nj17jt8TUZd/WW0At8D1wFTFzOURotktq9JsBPCc9JHfVB+hD8Ubb8ZDxAxsW+paUr
         XhVil7fJ7hVgHuUu51bBG0So/xOIC68OmZObWdLXMcC5Byv6lFUOHU3pSdLw9aobeq0F
         duTgeeAomRWUz809S13lFxaXdwQFCAwNlRdnIba8yxhFEN5dRLGMdrHmTiW0s5Bep5sp
         ePoFHlGWuE3Y/2jrKWiiNX9awGQQAjabyNpEZSwmcpC8ntEDCH5t7HSH0GRqIqC+The4
         aRbV1lIe/Tom+XPxURwevywGaNpMaOArfceIZraBdwUES/BN0T/bjyfUe9Bu3OPFkyeh
         GqUw==
X-Forwarded-Encrypted: i=1; AJvYcCUZg+r3XWzNZ1tVN6mVSnq3JCiqFILsEJLjBYH8IMDobWrmtvpauoSHWuJCJy1IE2VJFk0zV8Azds4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwuTspjRCpQTLYR8JpTBH7ZjzKKnMX/XoZ3a/+5p7zCFWUe1x0Y
	t5ixNwAdw8ijPhc4P9kmTRr57Rl8tS2CW/BGoHH579DXH5idS8SSEHlvDdcwiL5VMaBuAylxcIZ
	i/8huW7UVamEdgCmFtH4LcbCNqXgbLWO1MNP5v23D8u6LzD4LfvC8S7A8A5Bsf6Mv3k0qj0weNZ
	IsI9VR/WajHTkZy2fyE67yFpZoPmo4xiz+hNy9wg==
X-Gm-Gg: ASbGncvzM10aR2Z5tKLZa7WonPeZcriXpCwPWEfuXwQMieijnan4/XGlZ2fvAQxdmSM
	9vpJC7au/Zboh+uEEPMRXexJ0ElciXZPswbdWbS35Yc1lKz20sKdj99XZOqaW
X-Received: by 2002:a05:600c:c07:b0:439:4832:325f with SMTP id 5b1f17b1804b1-43948323427mr44529215e9.1.1739270442745;
        Tue, 11 Feb 2025 02:40:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbumiPynQJLdfXR/hK61jc+qEpAs+mRfIkPjt8BvK5dw/XkyvYRl2OENNVY4nN2HiUviGg5p2QXMZIr5RQ2vU=
X-Received: by 2002:a05:600c:c07:b0:439:4832:325f with SMTP id
 5b1f17b1804b1-43948323427mr44528985e9.1.1739270442437; Tue, 11 Feb 2025
 02:40:42 -0800 (PST)
MIME-Version: 1.0
References: <20250211000917.166856-1-mlevitsk@redhat.com> <20250211000917.166856-3-mlevitsk@redhat.com>
 <87seok25qx.wl-maz@kernel.org>
In-Reply-To: <87seok25qx.wl-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 11 Feb 2025 11:40:29 +0100
X-Gm-Features: AWEUYZnT1g0RdyJqMZtSUMcVn2SB8z3GSQjhvL_omNqa0pSFmSAU_EQ9poyWn3Q
Message-ID: <CABgObfa6DGM4X5HKb6FHoeiitTp4ddVaUGLRqK+Z=a-JLc9Bzw@mail.gmail.com>
Subject: Re: [PATCH 2/3] KVM: arm64: switch to using kvm_lock/unlock_all_vcpus
To: Marc Zyngier <maz@kernel.org>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org, 
	Jing Zhang <jingzhangos@google.com>, Oliver Upton <oliver.upton@linux.dev>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Randy Dunlap <rdunlap@infradead.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Zenghui Yu <yuzenghui@huawei.com>, kvm-riscv@lists.infradead.org, 
	Ingo Molnar <mingo@redhat.com>, linux-riscv@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas <bhelgaas@google.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, kvmarm@lists.linux.dev, 
	Alexander Potapenko <glider@google.com>, x86@kernel.org, Sean Christopherson <seanjc@google.com>, 
	Anup Patel <anup@brainfault.org>, Kunkun Jiang <jiangkunkun@huawei.com>, 
	Atish Patra <atishp@atishpatra.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nDqws0ZV1o28em1t1bjVwLgYeBrHXrWzX8BVuTy4RGM_1739270443
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_024047_527719_D88903AC 
X-CRM114-Status: GOOD (  25.22  )
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

T24gVHVlLCBGZWIgMTEsIDIwMjUgYXQgMTA6MjXigK9BTSBNYXJjIFp5bmdpZXIgPG1hekBrZXJu
ZWwub3JnPiB3cm90ZToKPiA+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+Cj4gQWN0
dWFsbHkgcGxlbnR5IG9mIGl0LgoKWWVzLCBkZWZpbml0ZWx5LiBUaGF0J3Mgbm90ICJubyBmdW5j
dGlvbmFsIGNoYW5nZSBpbnRlbmRlZCIsIGl0J3MgIm5vCmJyZWFrYWdlIG9mIHNhbmUgdXNlcnNw
YWNlIGludGVuZGVkIiB3aGljaCBpcyBwcmV0dHkgbXVjaCB0aGUKb3Bwb3NpdGUuCgo+IFlldCB0
aGUgbmV3IGhlbHBlciByZXR1cm5zIC1FSU5UUiwgd2hpY2ggeW91IGJsaW5kbHkgZm9yd2FyZCB0
byB1c2Vyc3BhY2UuCgpJdCB3b24ndCBxdWl0ZSByZWFjaCB1c2Vyc3BhY2UsIHNpbmNlIHRoZSB0
YXNrIHdvbid0IHN1cnZpdmUKbXV0ZXhfbG9ja19raWxsYWJsZSgpLiBXaXRoIHlvdXIgY3VycmVu
dCBjb2RlIHRoZSBraWxsIHdpbGwgYXJyaXZlCmp1c3QgYWZ0ZXIgdGhlIGlvY3RsIHJldHVybnMg
dG8gdXNlcnNwYWNlLCBzbyB0aGVyZSdzIG5vIGNoYW5nZSBpbgpiZWhhdmlvciB0aGVyZS4gVGhl
IC1FQlVTWSBjaGFuZ2UgaXMgdGhlIG9uZSB0aGF0IG1hdHRlcnMuCgo+IEF0IHRoZSBlbmQgb2Yg
dGhlIGRheSwgdGhlIHg4NiBsb2NraW5nIHNlcnZlcyBjb21wbGV0ZWx5IGRpZmZlcmVudAo+IHB1
cnBvc2VzLiBJdCB3YW50cyB0byBncmFjZWZ1bGx5IHdhaXQgZm9yIHZjcHVzIHRvIGV4aXQgYW5k
IGlzIGhhcHB5Cj4gdG8gcmVwbGF5IHRoaW5ncywgYmVjYXVzZSBtaWdyYXRpb24gKHdoaWNoIGlz
IHdoYXQgeDg2IHNlZW1zIHRvIGJlCj4gdXNpbmcgdGhpcyBmb3IpIGlzIGEgc3R1cGlkbHkgbG9u
ZyBwcm9jZXNzLgoKTm8sIGl0J3Mgbm90IHVzaW5nIGl0IGZvciB0aGUgd2hvbGUgbGVuZ3RoIG9m
IG1pZ3JhdGlvbi4gSXQgc2VydmVzIHRoZQpzYW1lIGV4YWN0IHB1cnBvc2UgYXMgQVJNOiBkbyBz
b21lIHN0dWZmIG9uIHNvbWV0aGluZyB0aGF0IHNwYW5zIGEKd2hvbGUgc3RydWN0IGt2bS4gVGhl
IG9ubHkgZGlmZmVyZW5jZSBpcyB0aGUgYmVoYXZpb3Igb24gY29udGVuZGVkCm11dGV4LCB3aGVy
ZSB4ODYgc2ltcGx5IHNheXMgZG9uJ3QgZG8gaXQuCgo+IE91ciBsb2NraW5nIGlzIGRlc2lnbmVk
IHRvCj4gZWl0aGVyIHN1Y2NlZWQgb3IgZmFpbCBxdWlja2x5LCBiZWNhdXNlIHNvbWUgb2YgdGhl
IGxvY2sgcGF0aHMgYXJlIG9uCj4gdGhlIGNyaXRpY2FsIHBhdGggZm9yIFZNIHN0YXJ0dXAgYW5k
IGNvbmZpZ3VyYXRpb24uCgpUaGUgb25seSBsb25nLXJ1bm5pbmcgdkNQVSBpb2N0bCBpcyBLVk1f
UlVOIGFuZCB5b3UgZG9uJ3QgaGF2ZSB0aGF0CmR1cmluZyBWTSBzdGFydHVwIGFuZCBjb25maWd1
cmF0aW9uLiBUaGUgaW50ZXJlc3RpbmcgY2FzZSBpcwpzbmFwc2hvdHRpbmcsIGkuZS4gcmVhZGlu
ZyBhdHRyaWJ1dGVzLgoKRmFpbGluZyBxdWlja2x5IHdoZW4gcmVhZGluZyBhdHRyaWJ1dGVzIG1h
a2VzIHNlbnNlLCBhbmQgSSdkIGJlCnJpZ2h0bHkgd2FyeSBvZiBjaGFuZ2luZyBpdC4gSSBrbm93
IHRoYXQgUUVNVSBpcyBkb2luZyB0aGVtIG9ubHkgd2hlbgppdCBrbm93cyBDUFVzIGFyZSBzdG9w
cGVkLCBidXQgaXQgZG9lcyBzZWVtIHRvIGFmZmVjdCBjcm9zdm0gYW5kCkZpcmVjcmFja2VyIG1v
cmUsIGZvciBzbmFwc2hvdHRpbmcgbW9yZSB0aGFuIHN0YXJ0dXAvY29uZmlndXJhdGlvbi4KVGhl
IEdJQyBzbmFwc2hvdHRpbmcgY29kZSBpbiBjcm9zdm0gcmV0dXJucyBhbiBhbnlob3c6OlJlc3Vs
dCBhbmQgZW5kcwp1cCBsb2dnaW5nIGFuIGVycm9yIHdpdGggcHJpbnRsbiEsIEZpcmVjcmFja2Vy
IGlzIHNpbWlsYXIgYXMgaXQgYWxzbwpwcm9wYWdhdGVzIHRoZSBlcnJvci4gU28gbmVpdGhlciBj
cm9zdm0gbm9yIEZpcmVjcmFja2VyIGhhdmUKcGFydGljdWxhcmx5IHNvcGhpc3RpY2F0ZWQgZXJy
b3IgaGFuZGxpbmcgYnV0IHRoZXkgZG8gc2VlbSB0byB3YW50IHRvCmZhaWwgdGhlaXIgUlBDcyBx
dWlja2x5LgoKRmFpbGluZyBxdWlja2x5IHdoZW4gY3JlYXRpbmcgdGhlIGRldmljZSBvciBzZXR0
aW5nIGF0dHJpYnV0ZXMgbWFrZXMKbGVzcyBzZW5zZSAoRmlyZWNyYWNrZXIgZm9yIG9uZSBkb2Vz
IGFuIHVud3JhcCgpIHRoZXJlKS4gQnV0IGFueWhvdwp0aGUgY2hhbmdlIHdvdWxkIGhhdmUgdG8g
YmUgYSBzZXBhcmF0ZSBwYXRjaCwgY2VydGFpbmx5IG5vdCBvbmUKYXBwbGllZCB0aHJvdWdoIHRo
ZSBnZW5lcmljIEtWTSB0cmVlOyBhbmQgaWYgeW91IGRlY2lkZSB0aGF0IHlvdSdyZQpzdHVjayB3
aXRoIGl0LCB0aGF0IHdvdWxkIGJlIG1vcmUgdGhhbiB1bmRlcnN0YW5kYWJsZS4KCj4gU28gZm9y
IHRoaXMgc2VyaWVzIHRvIGJlIGFjY2VwdGFibGUsIHlvdSdkIGhhdmUgdG8gcHJvdmlkZSB0aGUg
c2FtZQo+IHNlbWFudGljcy4gSXQgaXMgcHJvYmFibHkgZG9hYmxlIHdpdGggYSBiaXQgb2YgbWFj
cm8gbWFnaWMsIGF0IHRoZQo+IGV4cGVuc2Ugb2YgcmVhZGFiaWxpdHkuCgpPciBpdCBjYW4gYmUg
anVzdCBhbiBleHRyYSBib29sIGFyZ3VtZW50LCBwbHVzIHdyYXBwZXJzLgoKRm9yIFJJU0MtViBp
dCdzIG9ubHkgdXNlZCBhdCBkZXZpY2UgY3JlYXRpb24gdGltZSwgYW5kIHRoZSBpb2N0bCBmYWls
cwppZiB0aGUgdkNQVSByYW4gYXQgbGVhc3Qgb25jZS4gUmVtb3ZpbmcgdGhlICJ0cnkiIGluIHRy
eWxvY2sgaXMKdG90YWxseSBmZWFzaWJsZSB0aGVyZSwgaG93ZXZlciBpdCBtdXN0IGJlIGRvY3Vt
ZW50ZWQgaW4gdGhlIGNvbW1pdAptZXNzYWdlLgoKVGhhbmtzLAoKUGFvbG8KCj4gV2hhdCBJIHdv
dWxkIGFsc28gbGlrZSB0byBzZWUgaXMgZm9yIHRoaXMgcHJpbWl0aXZlIHRvIGJlIHVzYWJsZSB3
aXRoCj4gc2NvcGVkX2NvbmRfZ3VhcmQoKSwgd2hpY2ggd291bGQgbWFrZSB0aGUgY29kZSBtdWNo
IG1vcmUgcmVhZGFibGUuCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9rdm0tcmlzY3YK
