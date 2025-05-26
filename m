Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F7BC54FB3
	for <kvm-riscv@archiver.kernel.org>; Mon, 26 May 2025 20:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZMDum4gBweLFuWJ1eTAGXY/ZNYZXX56AG2H6JoKR5ho=; b=MhSx6wJ4HdrYI/
	Xt8+8mLdyVoJnfm3ckmseOQC1BiCqdGZCQ0bRz1HnwRTx5VZ37a4vhRqKMgmmeqWqlln5iaEmxr9D
	Wy1ozh/VpQwPOZeLx1kLTFUSgi2CTSbFZisNNt3LrPz8zn9MYIIbvaQCKNa1+AzUJhbEWDvyNoX4S
	wgLbMnvoH8VL62T3cueh4jlcVr96w33hlW9DhMzjPAdDDVSeFqyUgzoKH5X42Gr0b4VR0/NXZ9RrO
	h1rH8XjkDVFl8JRiLuSLV8KrqLns3hb3NjZXduml+g8NvpNyrF4W9vKniI9R2U8Ur4tPMibMOjSGV
	6405hn+vFxDjTRNrAtww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJeMH-00000009TdI-2LR1;
	Mon, 26 May 2025 20:23:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJeLH-00000009TZM-1s2h
	for kvm-riscv@lists.infradead.org;
	Mon, 26 May 2025 20:22:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748290958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xMGaQapG6+nm97TfKW/OCSgmi2X3lyhE0Z44n/TtsM0=;
	b=YUdeQPeHKYgFg9TJtBM3bm/fuqzVYvfMKjly7cNBhEsvKCH1EqesAZ7P6Pqz4gcmWdeSId
	yfSB/FYdjOZO+pQOqQgspGAlwYQdfG5bW6J+u24/Uf116CeM9FSy4JXHSqADAufg8oBBma
	sW7HS28bXi3CLy/4R7MpD5RCTj8HJSs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-ZLzQOUXmNcqfrZz9eWgnPQ-1; Mon, 26 May 2025 16:22:37 -0400
X-MC-Unique: ZLzQOUXmNcqfrZz9eWgnPQ-1
X-Mimecast-MFC-AGG-ID: ZLzQOUXmNcqfrZz9eWgnPQ_1748290956
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a3696a0d3aso956531f8f.2
        for <kvm-riscv@lists.infradead.org>; Mon, 26 May 2025 13:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748290956; x=1748895756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMGaQapG6+nm97TfKW/OCSgmi2X3lyhE0Z44n/TtsM0=;
        b=ocdl3xQ9mkuOv7e+14BtmT2xOd4x/P4Bb2cU3ulBL1m5iyh4jiT4REUpxIEdOtct69
         C2iI512C/ENP5aFRILBcrfPJbxOST0MwZtYYNDsgsupFe7FAHuRxZgPvPCucZol4tUpA
         wJ+TtYxQnU5HLtISPvqGwQlYaIBZq9yVzqD77qMmL7QbXSOI+YfwExvLaX2JHwR6/Sms
         xs2+GqNIpvjABPB6hUOh/UO71umhIIeTqEin59uuJMrqJw0FZ2EOR6D2Ac1OjN7uXjMY
         zXXnnzDvrVeGuWJB+QZOurZ5c2BYZlJV5Qs+lWeH1D2zktf367ysm6faYAgbo5oaFaPM
         XFLA==
X-Forwarded-Encrypted: i=1; AJvYcCUT4iLTdHjm9HoJYmmKZECT5OOZt7z/zkMaPVuFruiaFnaM7y9GO9rcyxbD4LTDSzl2V/c1ACZyp5A=@lists.infradead.org
X-Gm-Message-State: AOJu0YyA2i5R8/mZfbG0hwsLQHkJU8FPuaic3zL0F4De6wKHhbPTII76
	Y03zV8/IN1KU8g4NfxjRot3nQodwDTvum3u70809IOC8l/RSczu2c/qcB5/GpXcwhEmCbYB4sdC
	HLGP/CkTlU51R/8nM948PRe6irrBTYfsdUpOA2/NCMZBSDi6EaOQ9uX454jBqje4nQGD5zfX/RR
	ncA3MAto9CbhGrG79ti6ED1omvDUk7BvdK5MG/y3Qbng==
X-Gm-Gg: ASbGncsrnPuEXWxJZE88E7eh4P4KSqPTpll05FfzRQ2ioy0Et4alJLt3AEu1Y5FVx2Y
	g/xWyB/GrPG0QiWoceurfC205oAWFoU3W9QUu8W0oBvl4wchYjxl22p69fuUZl9PAoF4=
X-Received: by 2002:a05:6000:1814:b0:3a4:cb8e:d118 with SMTP id ffacd0b85a97d-3a4cb8ed307mr6669843f8f.24.1748290956044;
        Mon, 26 May 2025 13:22:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDiymxARCDcZPCHxy/Xz46jJP275t8/OtIIOm6ZkqfxnurlcmDMDRRtdCzNxlU2TSGevwUXa1uw0tO3yKwJTQ=
X-Received: by 2002:a05:6000:1814:b0:3a4:cb8e:d118 with SMTP id
 ffacd0b85a97d-3a4cb8ed307mr6669831f8f.24.1748290955743; Mon, 26 May 2025
 13:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy0H6GEBaY1NfCyF5O1PsHAmuxgW4mQyoC47bVFmMjqk-Q@mail.gmail.com>
In-Reply-To: <CAAhSdy0H6GEBaY1NfCyF5O1PsHAmuxgW4mQyoC47bVFmMjqk-Q@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 26 May 2025 22:22:24 +0200
X-Gm-Features: AX0GCFuO9oYQV6T3lK7DsSjx0oOC2d8-4m0DKglynmA2n2l4ofByHtcVbnPU7QQ
Message-ID: <CABgObfa0P5gnNoqsh6d-Bg8s5otJxVK-5MHH4O47Z2k2WZL-8Q@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.16
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atish.patra@linux.dev>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Jzu94-C1n37N8y-kXbsWDys2unm6877IWip40O5jam4_1748290956
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_132239_562970_830F3B5D 
X-CRM114-Status: GOOD (  17.13  )
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

T24gU2F0LCBNYXkgMjQsIDIwMjUgYXQgNjo1M+KAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gSGkgUGFvbG8sCj4KPiBXZSBoYXZlIHRoZSBmb2xsb3dpbmcg
S1ZNIFJJU0MtViBjaGFuZ2VzIGZvciA2LjE2Ogo+IDEpIEFkZCB2ZWN0b3IgcmVnaXN0ZXJzIHRv
IGdldC1yZWctbGlzdCBzZWxmdGVzdAo+IDIpIFZDUFUgcmVzZXQgcmVsYXRlZCBpbXByb3ZlbWVu
dHMKPiAzKSBSZW1vdmUgc2NvdW50ZXJlbiBpbml0aWFsaXphdGlvbiBmcm9tIFZDUFUgcmVzZXQK
PiA0KSBTdXBwb3J0IFZDUFUgcmVzZXQgZnJvbSB1c2Vyc3BhY2UgdXNpbmcgc2V0X21wc3RhdGUo
KSBpb2N0bAo+ICAgICAoTk9URTogd2UgaGF2ZSByZS11c2VkIEtWTV9NUF9TVEFURV9JTklUX1JF
Q0VJVkVECj4gICAgICBmb3IgdGhpcyBwdXJwb3NlIHNpbmNlIGl0IGlzIGEgdGVtcG9yYXJ5IHN0
YXRlLiBUaGlzIHdheSBvZgo+ICAgICAgVkNQVSByZXNldCBvbmx5IHJlc2V0cyB0aGUgcmVnaXN0
ZXIgc3RhdGUgYW5kIGRvZXMgbm90Cj4gICAgICBhZmZlY3QgdGhlIGFjdHVhbCBWQ1BVIE1QX1NU
QVRFLiBUaGlzIG5ldyBtZWNoYW5pc20KPiAgICAgIG9mIFZDUFUgcmVzZXQgY2FuIGJlIHVzZWQg
YnkgS1ZNIHVzZXIgc3BhY2UgdXBvbgo+ICAgICAgU0JJIHN5c3RlbSByZXNldCB0byByZXNldCB0
aGUgcmVnaXN0ZXIgc3RhdGUgb2YgdGhlIFZDUFUKPiAgICAgIGluaXRpYXRpbmcgU0JJIHN5c3Rl
bSByZXNldC4gKQoKUHVsbGVkLCB0aGFua3MuIE5vdGUgdGhhdCBLVk1fQ0FQX1JJU0NWX01QX1NU
QVRFX1JFU0VUIGlzIDI0MiBkdWUgdG8KY29uZmxpY3RzIHdpdGgga3ZtLWFybSdzIGFzc2lnbm1l
bnQgb2YgY2FwYWJpbGl0eSBudW1iZXJzLgoKUGFvbG8KCj4gUGxlYXNlIHB1bGwuCj4KPiBSZWdh
cmRzLAo+IEFudXAKPgo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgODdlYzdk
NTI0OWJiOGViZjQwMjYxNDIwZGEwNjlmYTIzOGMyMTc4OToKPgo+ICAgS1ZNOiBSSVNDLVY6IHJl
c2V0IHNtc3RhdGVlbiBDU1JzICgyMDI1LTA1LTAxIDE4OjI2OjE0ICswNTMwKQo+Cj4gYXJlIGF2
YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4KPiAgIGh0dHBzOi8vZ2l0aHViLmNv
bS9rdm0tcmlzY3YvbGludXguZ2l0IHRhZ3Mva3ZtLXJpc2N2LTYuMTYtMQo+Cj4gZm9yIHlvdSB0
byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDc5MTdiZTE3MDkyODE4OWZlZmFkNDkwZDFhMTIzN2ZkZmE2
Yjg1NmY6Cj4KPiAgIFJJU0MtVjogS1ZNOiBsb2NrIHRoZSBjb3JyZWN0IG1wX3N0YXRlIGR1cmlu
ZyByZXNldCAoMjAyNS0wNS0yNAo+IDIxOjMwOjQ3ICswNTMwKQo+Cj4gLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IEtWTS9y
aXNjdiBjaGFuZ2VzIGZvciA2LjE2Cj4KPiAtIEFkZCB2ZWN0b3IgcmVnaXN0ZXJzIHRvIGdldC1y
ZWctbGlzdCBzZWxmdGVzdAo+IC0gVkNQVSByZXNldCByZWxhdGVkIGltcHJvdmVtZW50cwo+IC0g
UmVtb3ZlIHNjb3VudGVyZW4gaW5pdGlhbGl6YXRpb24gZnJvbSBWQ1BVIHJlc2V0Cj4gLSBTdXBw
b3J0IFZDUFUgcmVzZXQgZnJvbSB1c2Vyc3BhY2UgdXNpbmcgc2V0X21wc3RhdGUoKSBpb2N0bAo+
Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+IEF0aXNoIFBhdHJhICg1KToKPiAgICAgICBLVk06IHJpc2N2OiBzZWxmdGVz
dHM6IEFsaWduIHRoZSB0cmFwIGluZm9ybWF0aW9uIHdpaHQgcHRfcmVncwo+ICAgICAgIEtWTTog
cmlzY3Y6IHNlbGZ0ZXN0czogRGVjb2RlIHN0dmFsIHRvIGlkZW50aWZ5IGV4YWN0IGV4Y2VwdGlv
biB0eXBlCj4gICAgICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBZGQgdmVjdG9yIGV4dGVuc2lv
biB0ZXN0cwo+ICAgICAgIFJJU0MtVjogS1ZNOiBSZW1vdmUgZXhwZXJpbWVudGFsIHRhZyBmb3Ig
UklTQy1WCj4gICAgICAgUklTQy1WOiBLVk06IFJlbW92ZSBzY291bnRlcmVuIGluaXRpYWxpemF0
aW9uCj4KPiBSYWRpbSBLcsSNbcOhxZkgKDUpOgo+ICAgICAgIEtWTTogUklTQy1WOiByZWZhY3Rv
ciB2ZWN0b3Igc3RhdGUgcmVzZXQKPiAgICAgICBLVk06IFJJU0MtVjogcmVmYWN0b3Igc2JpIHJl
c2V0IHJlcXVlc3QKPiAgICAgICBLVk06IFJJU0MtVjogcmVtb3ZlIHVubmVjZXNzYXJ5IFNCSSBy
ZXNldCBzdGF0ZQo+ICAgICAgIFJJU0MtVjogS1ZNOiBhZGQgS1ZNX0NBUF9SSVNDVl9NUF9TVEFU
RV9SRVNFVAo+ICAgICAgIFJJU0MtVjogS1ZNOiBsb2NrIHRoZSBjb3JyZWN0IG1wX3N0YXRlIGR1
cmluZyByZXNldAo+Cj4gIERvY3VtZW50YXRpb24vdmlydC9rdm0vYXBpLnJzdCAgICAgICAgICAg
ICAgICAgICAgIHwgIDExICsrCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2FpYS5oICAg
ICAgICAgICAgICAgICAgIHwgICAzIC0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9z
dC5oICAgICAgICAgICAgICAgICAgfCAgMTcgKystCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
a3ZtX3ZjcHVfc2JpLmggICAgICAgICAgICAgIHwgICAzICsKPiAgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9rdm1fdmNwdV92ZWN0b3IuaCAgICAgICAgICAgfCAgIDYgKy0KPiAgYXJjaC9yaXNjdi9r
ZXJuZWwvaGVhZC5TICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTAgKysKPiAgYXJjaC9y
aXNjdi9rdm0vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAg
YXJjaC9yaXNjdi9rdm0vYWlhX2RldmljZS5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQg
Ky0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgNjQgKysrKystLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAzMiArKysrLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9oc20u
YyAgICAgICAgICAgICAgICAgICAgICB8ICAxMyArLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3Ni
aV9zeXN0ZW0uYyAgICAgICAgICAgICAgICAgICB8ICAxMCArLQo+ICBhcmNoL3Jpc2N2L2t2bS92
Y3B1X3ZlY3Rvci5jICAgICAgICAgICAgICAgICAgICAgICB8ICAxMyArLQo+ICBhcmNoL3Jpc2N2
L2t2bS92bS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMyArKwo+ICBpbmNs
dWRlL3VhcGkvbGludXgva3ZtLmggICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4g
IC4uLi9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmggICAgICAgIHwgIDIz
ICsrKy0KPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9oYW5kbGVycy5T
ICAgfCAxMzkgKysrKysrKysrKystLS0tLS0tLS0tCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2t2bS9saWIvcmlzY3YvcHJvY2Vzc29yLmMgIHwgICAyICstCj4gIHRvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS9yaXNjdi9hcmNoX3RpbWVyLmMgICAgIHwgICAyICstCj4gIHRvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9lYnJlYWtfdGVzdC5jICAgIHwgICAyICstCj4gIHRvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyAgIHwgMTMyICsrKysr
KysrKysrKysrKysrKysKPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L3NiaV9w
bXVfdGVzdC5jICAgfCAgMjQgKysrLQo+ICAyMiBmaWxlcyBjaGFuZ2VkLCAzNzQgaW5zZXJ0aW9u
cygrKSwgMTUyIGRlbGV0aW9ucygtKQo+CgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3Zt
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
