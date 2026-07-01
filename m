Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2857FC43458
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 01:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JlY0WrU3oeFXQZppP/vRxHEXH+pw/q6xyNjB37A4ZaA=; b=GWMZPzBgBuxj0d
	pMjCMd4KrmgJdMbTqSbxuQojgrQ6hwV+we3UwJIqrNzhrIKqtAahDPsQgNe7Oj9jgapYSVRBqtZ/D
	4syE3dno2L4q4som/NE27fowBUcgnhF16EiCltSo8ozEcSSf8Ae8HHJHq5UDsNnbK7MmwmhpcJ5G/
	bniolFaOEJnWLXG+Zhi3IXSKHfDhOBYoPf+I8z/Oq76liCzWPb/+2jF1mZ7GNqyGfdEV8EnwYNY8D
	EP217zqO+83kgzoODh8E/uZ5Y03FZeFejtgiC5Lkj6/OESHiELKFkBpp1PKcQvg3SSA3oLd7D71gN
	MEhSivzyjyEdYuPtAukg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weja7-00000000RXT-2ECx;
	Wed, 01 Jul 2026 01:17:39 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weja4-00000000RWf-1eXC
	for kvm-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 01:17:38 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-30c591fb1cbso95042eec.1
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Jun 2026 18:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782868655; x=1783473455; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EtMWeNmrDijSuvzYdFzBzIe5+kn8Pd5DLzMwnJd/LPU=;
        b=siVmHafPoSIoVf8c9zkOHmovw+TrG0NHXwI7+b6Lc/knrDg7zHyVluXEWu+hKAb3We
         04JnZnFHv6nUVNZnQC6F8Ij+DJrncstQVFUpHBh0pVJ6zWkROEs1UtJWRmqtmvYOIQ1n
         7FhytnUlCz9HjTup9iIdsQF7JWEH2zn/AdvnbehE7gOKti+aUD7pioFcir/gAxGprDrb
         JQF9I54GH8WUcrInNEG55ek5ESw8RLazR/7ukf6lXtDjBQL3lVuj4ZGlym3hteLLdE/G
         0YFun+T28hcLdEZM8UrFciNRA381PiZNw9hvQBaNGPHMsAUJ+TlEfwCqNjTXcv3iJLHL
         aUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782868655; x=1783473455;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EtMWeNmrDijSuvzYdFzBzIe5+kn8Pd5DLzMwnJd/LPU=;
        b=jWapePFW6beY+f4i6gSsNid5zZVsDPIiCYco0Nh8RRmRlX4DRAASH6bV5UEEVYxVRF
         Yu9P570x32U7Vi7ieisoC3Vx0QOxWkvl7D2LIN3izHQoI4W1/swsyQaOhD09OVm+mrlj
         zawMLm+7oAfC1kPsv4oIRAwUn7v33nlEiNiw2suxriu6fcTESU87SgPuGi15tv3TMTQa
         KCCwg9OrAdr1EM4ZyW2zuZRvWO6LmdtH0q9tRwb+jOOpbyLtX7CzlBOMGcw3Qx2qxbck
         vfgHn7pNJicES6PaNpx1+09o2pZBD7yVMFoqCccgDbIimtTjvrC9wJOZglcjGuQsvgDU
         cIiQ==
X-Forwarded-Encrypted: i=1; AHgh+RriOiQlkXrASCOaLHjkDousDS2yyqVw7dPcfin9o2sdjDbHexSThNQaQ86x0es+91KfGCYlbQ3Ly14=@lists.infradead.org
X-Gm-Message-State: AOJu0YzvOV/IrzjT1n/+EBNZ2WhjQEmMWLBDooy28YypcB90lqblZq8/
	4nVE1Il3c9olo10M/u5q5+rfGwGOyqri9BiXtjw0wgq46gooGtiyvhgv
X-Gm-Gg: AfdE7cm8rRQAi2A7Dcbn50LH3ZE6eU7eP+41w/4aeNtbKmLL02wFHt/g1/U37UXyOCO
	SWGCoP2FieBx/B8jWci35M4vh62wAZdqGDjI+ooYjBCdUzBnqDW+ly2hLBz1oyOYmqTrW83bGbS
	Pkm2mzFKDldtTVCR/xV6OK2il97QaLZTNjYyfquiVdyq9qTZxKXhUXW0YOZOzddgVR231p23DBQ
	s8hvSKgQFC1roJr5uLbZ9Z8hJ6VlXH+JdZx0DjqHW0x7bABdUYMnEyxgyID4TAn52houCK/7AGT
	hPvuyvktTObpPuUJalGthzGMmJ1k16PCj+KXo25Di1VssvFXUVvvkGHfoDSYMLKuUF9A1u5Yhjd
	061+6fYEhepHstz6YTU3KA0lcmONY8WD+kk9PdtkILuRWUdKMpXo0ainV+ESAEULMCRW3MWzpAg
	JWNErZ5cIYSScwMv7+ilsZ0yjRtZgAeUgFibSw7XLAP8k=
X-Received: by 2002:a05:7300:fd13:b0:30c:9f31:b62a with SMTP id 5a478bee46e88-30ef084fd6bmr2062142eec.10.1782868654974;
        Tue, 30 Jun 2026 18:17:34 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30efaadc5bfsm940139eec.28.2026.06.30.18.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 18:17:34 -0700 (PDT)
Date: Tue, 30 Jun 2026 18:17:31 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Nam Cao <namcao@linutronix.de>, Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Conor Dooley <conor@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 01/16] riscv: Introduce instruction table generation
Message-ID: <akRqqxVMmzCJUpxp@blinky>
References: <20260621-riscv_insn_table-v2-0-7f0810ee2274@gmail.com>
 <20260621-riscv_insn_table-v2-1-7f0810ee2274@gmail.com>
 <DJMJB4B8Q57Y.34SUOKB6MD8IE@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DJMJB4B8Q57Y.34SUOKB6MD8IE@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_181736_611188_D5105B1A 
X-CRM114-Status: GOOD (  22.35  )
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

T24gVHVlLCBKdW4gMzAsIDIwMjYgYXQgMDY6NDU6NTFQTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+IDIwMjYtMDYtMjFUMjE6MDE6MTktMDc6MDAsIENoYXJsaWUgSmVua2lucyB2aWEg
QjQgUmVsYXkgPGRldm51bGwrdGhlY2hhcmxlc2plbmtpbnMuZ21haWwuY29tQGtlcm5lbC5vcmc+
Ogo+ID4gRnJvbTogQ2hhcmxpZSBKZW5raW5zIDx0aGVjaGFybGVzamVua2luc0BnbWFpbC5jb20+
Cj4gPgo+ID4gRWxpbWluYXRlIHRoZSBuZWVkIHRvIGhhbmQtd3JpdGUgcmlzY3YgaW5zdHJ1Y3Rp
b25zIGJ5IHVzaW5nIGEgc2hlbGwKPiA+IHNjcmlwdCB0byBhdXRvZ2VuZXJhdGUgYSBoZWFkZXIg
ZnJvbSBhbiBpbnN0cnVjdGlvbiB0YWJsZS4gVGhpcyBpcyBtb2RlbGVkCj4gPiBhZnRlciB0aGUg
c3lzY2FsbCB0YWJsZSBpbmZyYXN0cnVjdHVyZS4KPiA+Cj4gPiBUaGUgdGFibGUgaXMgZ2VuZXJh
dGVkIGV4dGVybmFsbHkgYnkgcmlzY3YtdW5pZmllZC1kYiBbMV0sIGJ1dCBpcwo+ID4gaW4gYSBz
aW1wbGUgZm9ybWF0IHRvIG1ha2UgaXQgcG9zc2libGUgdG8gdXNlIG90aGVyIHRvb2xzIG9yIG1v
ZGlmeQo+ID4gbWFudWFsbHkuCj4gPgo+ID4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1z
b2Z0d2FyZS1zcmMvcmlzY3YtdW5pZmllZC1kYgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IENoYXJs
aWUgSmVua2lucyA8dGhlY2hhcmxlc2plbmtpbnNAZ21haWwuY29tPgo+ID4KPiA+IC0tLQo+ID4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvdG9vbHMvaW5zbi50YmwgYi9hcmNoL3Jpc2N2L3Rvb2xz
L2luc24udGJsCj4gPiBAQCAtMCwwICsxLDEzOTIgQEAKPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBCU0QtMy1DbGF1c2UtQ2xlYXIKPiA+ICsjCj4gPiArIyBHRU5FUkFURUQgV0lUSCBo
dHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytc29mdHdhcmUtc3JjL3Jpc2N2LXVuaWZpZWQtZGIKPiA+
ICsjICIuL2Jpbi9nZW5lcmF0ZSBpbnN0LXRhYmxlIC1vIHRlc3RfdGFibGUudHh0Igo+IAo+IEkg
Y2hlY2tlZCBvdXQgdGhlIHJlcG8sIHJhbiB0aGUgY29tbWFuZCwgYW5kIGdvdCBhIGRpZmZlcmVu
dCB0YWJsZToKPiAKPiA+ICthbmRuIGNvbW1vbiAwMTAwMDAwPDI1fDExMTwxMnwwMTEwMDExPDAg
eHMyPTI0LTIwIHhzMT0xOS0xNSB4ZD0xMS03Cj4gICAgYW5kbiBjb21tb24gMDEwMDAwMDwzMXwx
MTE8MTR8MDExMDAxMTw3IHhzMj0yNC0yMCB4czE9MTktMTUgeGQ9MTEtNwo+IAo+IEkgYXNzdW1l
IHRoZXJlIHdlcmUgc29tZSByZWNlbnQgY2hhbmdlcyBpbiB0aGUgb3V0cHV0IGZvcm1hdC4uLgo+
IAo+IEkgdGhpbmsgaXQgd291bGQgYmUgbmljZSB0byB1c2UgdGhlaXIgbGF0ZXN0IGZvcm1hdCBh
bmQgYWxzbyBub3RlIHRoZQo+IFVEQiBjb21taXQgdGhhdCB3YXMgdXNlZCwgc28gaXQncyBlYXNp
ZXIgdG8gcmVwcm9kdWNlIG91ciBmaWxlLgo+IEhvcGVmdWxseSB0aGVyZSB3b24ndCBiZSBicmVh
a2luZyBjaGFuZ2VzIHRvbyBvZnRlbi4gOikKCkkgaGF2ZSBhIFBSIG9wZW4gdG8gZml4IHRoaXMg
YnVnIHRoYXQgSSBtaXNzZWQgd2hlbiBpdCBnb3QgbWVyZ2VkLCBvbmNlCnRoYXQgZ2V0cyBtZXJn
ZWQgSSBjYW4gbGluayB0aGUgaGFzaCBhbmQgdGhlcmUgd2lsbCBubyBsb25nZXIgYmUgdGhpcwpt
aXNtYXRjaC4KCj4gCj4gVGhhbmtzLgo+IAo+IC0tLQo+IFNhc2hpa28gc2VlbXMgdG8gaGF2ZSBu
b3RpY2VkIGEgcGxlbnR5IG9mIG90aGVyIGlzc3Vlcywgc28gSSBkaWRuJ3QKPiByZXZpZXcgbW9y
ZS4uLgoKT2ggdGhhbmtzLCBJJ2xsIGNoZWNrIHRoYXQgb3V0LgoKLSBDaGFybGllCgoKLS0gCmt2
bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
