Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299D5CD8CA8
	for <kvm-riscv@archiver.kernel.org>; Fri, 12 Jun 2026 13:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A9DmiRnN3RoLRJ2gty0odse4MfmNoYAGw3nmfEmHOvU=; b=nM5j7hWgjKx3rj
	yvJwJkXG//blDlMKmkVx2BXBPVg34pQ952ZzEguvBtMIJ3w3DPjSnBpuWPjaCKKrPesLnKv6v+kRu
	Ggvr8SS4dwtu6qMl+uWyHP2bQRPMbThI9DU6e1oDWjWheHgTlAiexOkAHl6c6GLXFzWrLbXIs/sa7
	rzEtD9DsXxo4HMTQb1Gqz//pZ0zPtqcokzivkht645J0fBvTgMcEuuB9WQ6H1AbGuo2aFCRQC5Uri
	Cac2UKMt23lPUiBvi/qE+r8EdPcB4JNOAOydaPQT/dLMybrW/Owe/5zUs3MtIqKz2riDQSAZ4lvh8
	9WGiQjslfzSM7XsKG+KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2IT-0000000B0qR-3bNk;
	Fri, 12 Jun 2026 13:51:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2IP-0000000B0pd-3nPy
	for kvm-riscv@lists.infradead.org;
	Fri, 12 Jun 2026 13:51:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781272299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Iy/v7kxpOlqBCTDcC4jlmM2w9KphND71Hvl/We9DfQ4=;
	b=i6YiM2YyNXHiwRbhNA/QhABUluPzjhF+SZH7Kufc2t74ECfvvYDnVI0HPBqfKtI7X8UDmz
	BOLRabnIoUT6r75BvdK9jJN1oTiL6+tbp6+968xBN5wOSUppdq0fTo10ddbZVe643DXG3K
	T5UOw4p9oM5Yxp+qdsIvaN746I8lBO8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-8RFcymy6PZO3NJ4hCo9H6Q-1; Fri, 12 Jun 2026 09:51:35 -0400
X-MC-Unique: 8RFcymy6PZO3NJ4hCo9H6Q-1
X-Mimecast-MFC-AGG-ID: 8RFcymy6PZO3NJ4hCo9H6Q_1781272295
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157a31ac37so152140285a.2
        for <kvm-riscv@lists.infradead.org>; Fri, 12 Jun 2026 06:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781272295; x=1781877095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Iy/v7kxpOlqBCTDcC4jlmM2w9KphND71Hvl/We9DfQ4=;
        b=GzkDjUMCdDA6q7JYgGp6BOfKEFzsAYTUYlEFBrjlxfzZKHsj6msSlIeNlG56NbEACs
         pBrZ++5mbBeE5TjiCYRc6xiUvBWq7Tr/ohz/uvAcDr8XAaYgidPK3IU9WAvXDVERG2A2
         +lxRZ2s1ZHO5r3abi9+xMe7NUBwrY8rkh6oAgOXJhD0dlMmvXv9Yf9neFfyBoGFqFn9s
         tspvyNHATH5nAQEja0TzYPpShBAXb8zGo0NaX1nCI1RpR8iyvSwXLx6i8w/EuHg5oX6r
         Mts/A7knlTWGbB59ztX1wJf1w5JRplxACrYZzzKHHR2ATw5fEEEvMf5MikxPeidEeBO+
         TfPg==
X-Forwarded-Encrypted: i=1; AFNElJ9zSj6cGpMCYtx19cRa7bF7BYBYORSYpQfdilbjG3Cyl6U6VZSg9oD+q7adkkjU7O/VUcdvsNa+bS4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz18TYZgYzNqHjLihKe4FYeh9Y9vZwCHGIRArAKJRQWiMwiTr0z
	rZ6cxPYfiad9vM5XHG/br+gWB5+nAX1G/GbcJzPRFHYVA+FF50h2tXt/1Uo6EnMnw5iTZDsgWqA
	sS1TpJNTQrnqzOV4wgzu3YmvXlQJ3RfjflrqK41qhgEmxauIO6+yJjReVhAM+071iPIy+GH7h5m
	ZlfwrNFujPcQSIcBHHIA09JCqtPkZpssrvuIAcLGis+w==
X-Gm-Gg: Acq92OGcky1jZdaXUu3up9XYjf/tsdGGoHtaaiUNMVX8bMuaKHrZ2KC1fxxzA55uC8d
	Njid9aw5fHJ66/52QPaP2Z8fxmYZk9nHAiWFEGVzmD4DZ62gxgPg3wXn0/PZRMSRgeMsUdbFSeh
	T/D1LoR5XIdE/dMcykq47+/Od5huf272zvKEMTqLvp60H1IrumGB1dsIQo9lft5ismXouYlG4D8
	xVGuqSZY/d81n7zUpj2yQppM1qlcPoIQOtyaA==
X-Received: by 2002:a05:620a:4149:b0:915:d5cd:8cce with SMTP id af79cd13be357-9161bc02c6bmr425212985a.22.1781272295113;
        Fri, 12 Jun 2026 06:51:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4149:b0:915:d5cd:8cce with SMTP id
 af79cd13be357-9161bc02c6bmr425204785a.22.1781272294560; Fri, 12 Jun 2026
 06:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com> <20260611-rva23u64-hwprobe-v2-v4-5-3f01a2449488@gmail.com>
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-5-3f01a2449488@gmail.com>
From: Jesse Taube <jtaubepe@redhat.com>
Date: Fri, 12 Jun 2026 09:51:22 -0400
X-Gm-Features: AVVi8Cei37Nc7wEh-QPxeO4jIlCv0ZbORPC259y2xDJU0379i8L_rI91Rp2DJbE
Message-ID: <CADRr4bd10AYwAZwHxEiuSJEOwD5qv68L1r5DRjxXFM8pmrG+WA@mail.gmail.com>
Subject: Re: [PATCH v4 05/16] riscv: Add Zicclsm to cpufeature and hwprobe
To: Guodong Xu <docular.xu@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
	spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, 
	Jesse Taube <jesse@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Andy Chiu <andybnac@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qmiCaj8DfGK0Am8Cjiaq7wz187-HZD1IjeyottyL48s_1781272295
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_065142_017307_61FB83D7 
X-CRM114-Status: GOOD (  26.32  )
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

T24gVGh1LCBKdW4gMTEsIDIwMjYgYXQgNDoxNOKAr1BNIEd1b2RvbmcgWHUgPGRvY3VsYXIueHVA
Z21haWwuY29tPiB3cm90ZToKPgo+IEZyb206IEplc3NlIFRhdWJlIDxqZXNzZUByaXZvc2luYy5j
b20+Cj4KPiBaaWNjbHNtIHJlcXVpcmVzIG1pc2FsaWduZWQgc3VwcG9ydCBmb3IgYWxsIHJlZ3Vs
YXIgbG9hZCBhbmQgc3RvcmUKPiBpbnN0cnVjdGlvbnMsIGJvdGggc2NhbGFyIGFuZCB2ZWN0b3Is
IGJ1dCBub3QgQU1PcyBvciBvdGhlcgo+IHNwZWNpYWxpemVkIGZvcm1zIG9mIG1lbW9yeSBhY2Nl
c3MsIHRvIG1haW4gbWVtb3J5IHJlZ2lvbnMgd2l0aCBib3RoCj4gdGhlIGNhY2hlYWJpbGl0eSBh
bmQgY29oZXJlbmNlIFBNQXMsIGFzIGRlZmluZWQgaW4gdGhlIHByb2ZpbGVzIHNwZWMuCj4gRXZl
biB0aG91Z2ggbWFuZGF0ZWQsIG1pc2FsaWduZWQgbG9hZHMgYW5kIHN0b3JlcyBtaWdodCBleGVj
dXRlCj4gZXh0cmVtZWx5IHNsb3dseS4gU3RhbmRhcmQgc29mdHdhcmUgZGlzdHJpYnV0aW9ucyBz
aG91bGQgYXNzdW1lIHRoZWlyCj4gZXhpc3RlbmNlIG9ubHkgZm9yIGNvcnJlY3RuZXNzLCBub3Qg
Zm9yIHBlcmZvcm1hbmNlLgo+Cj4gUmV2aWV3ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNp
Zml2ZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2lu
Yy5jb20+Cj4gVGVzdGVkLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IEplc3NlIFRhdWJlIDxqZXNzZUByaXZvc2luYy5jb20+CgpUaGFu
a3MgZm9yIHRoZSB1cGRhdGUhIEp1c3QgYW4gZnlpIGVtYWlsIGhhcyBjaGFuZ2VkIHRvCmp0YXVi
ZXBlQHJlZGhhdC5jb20gdGhvdWdoLgpObyBuZWVkIHRvIGNoYW5nZSB0aGUgc2lnbm9mZiB0aG91
Z2guCgpUaGFua3MsCkplc3NlIFRhdWJlCgo+IFtSZWJhc2VkLCByZXdyb3RlIGRvYyB0ZXh0LCBt
aW5vciBjb21taXQgbWVzc2FnZSByZXZpc2lvbnNdCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEpv
bmVzIDxhbmRyZXcuam9uZXNAb3NzLnF1YWxjb21tLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBHdW9k
b25nIFh1IDxkb2N1bGFyLnh1QGdtYWlsLmNvbT4KPgo+IC0tLQo+IHY0OiBObyBjaGFuZ2UuCj4g
djM6Cj4gLSBNb3ZlIHRoZSBod3Byb2JlLnJzdCBlbnRyeSB0byB0aGUgSU1BX0VYVF8xIHNlY3Rp
b24gc28gaXRzCj4gICBkb2N1bWVudGF0aW9uIG1hdGNoZXMgdGhlIElNQV9FWFRfMSBiaXQgaXQg
d2FzIGFsbG9jYXRlZCBpbiB2Mgo+ICAgKFNhc2hpa28sIGFncmVlZCBieSBBbmRyZXcpLgo+IHYy
Ogo+IC0gUmViYXNlZCBvbnRvIHY3LjEtcmMyOyBtb3ZlZCBaSUNDTFNNIHRvIElNQV9FWFRfMSBh
bmQKPiAgIGFsbG9jYXRlZCBhIG5ldyBiaXQgZm9yIGl0Cj4gLS0tCj4gIERvY3VtZW50YXRpb24v
YXJjaC9yaXNjdi9od3Byb2JlLnJzdCAgfCA0ICsrKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9od2NhcC5oICAgICAgICB8IDEgKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdw
cm9iZS5oIHwgMSArCj4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAgICAgICAgfCAx
ICsKPiAgYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyAgICAgICB8IDEgKwo+ICA1IGZp
bGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3By
b2JlLnJzdAo+IGluZGV4IGQ5OTI4NjQxZGViOTkuLjQ5ZDlmYjY4NjMyZDAgMTAwNjQ0Cj4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0Cj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0Cj4gQEAgLTQwMSwzICs0MDEsNyBAQCBUaGUgZm9s
bG93aW5nIGtleXMgYXJlIGRlZmluZWQ6Cj4gICAgICBhcyBkZWZpbmVkIGluIHZlcnNpb24gMS4w
IG9mIHRoZSBSSVNDLVYgQ29udHJvbC1mbG93IEludGVncml0eSAoQ0ZJKQo+ICAgICAgZXh0ZW5z
aW9ucyBzcGVjaWZpY2F0aW9uLCByYXRpZmllZCBpbiBjb21taXQgMzAyYTJkNDVjMjQzCj4gICAg
ICAoIlVwZGF0ZSBidWlsZC1wZGYueW1sIikgb2YgcmlzY3YtY2ZpLgo+ICsKPiArICAqIDpjOm1h
Y3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aSUNDTFNNYDogVGhlIFppY2Nsc20gZXh0ZW5zaW9uIGlz
IHN1cHBvcnRlZCwKPiArICAgIGFzIGRlZmluZWQgaW4gdGhlIFJJU0MtViBQcm9maWxlcyBzcGVj
aWZpY2F0aW9uIHN0YXJ0aW5nIGZyb20gY29tbWl0Cj4gKyAgICBiMWQ4MDY2MCAoIlVwZGF0ZWQg
dG8gcmF0aWZpZWQgc3RhdGUuIikKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9od2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gaW5kZXggNDRiZjhj
N2Q4YWNjNS4uZThmNGE3ZGQ5NmE5MyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2h3Y2FwLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiBAQCAt
MTEyLDYgKzExMiw3IEBACj4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQ0xTRCAgICAgICAgICAg
IDEwMwo+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWklDRklMUCAgICAgICAgICAxMDQKPiAgI2Rl
ZmluZSBSSVNDVl9JU0FfRVhUX1pJQ0ZJU1MgICAgICAgICAgMTA1Cj4gKyNkZWZpbmUgUklTQ1Zf
SVNBX0VYVF9aSUNDTFNNICAgICAgICAgIDEwNgo+Cj4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9Y
TElOVVhFTlZDRkcgICAgIDEyNwo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91
YXBpL2FzbS9od3Byb2JlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5o
Cj4gaW5kZXggOTEzOWVkYmEwYWVjYi4uNjgxOWRmMTU5YzUxZSAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2h3cHJvYmUuaAo+IEBAIC0xMTYsNiArMTE2LDcgQEAgc3RydWN0IHJpc2N2
X2h3cHJvYmUgewo+ICAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX1pJQ0JPUF9CTE9DS19TSVpF
ICAgIDE1Cj4gICNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9LRVlfSU1BX0VYVF8xICAgICAgICAgICAg
MTYKPiAgI2RlZmluZSAgICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX0VYVF9aSUNGSVNTICAg
ICAgICgxVUxMIDw8IDApCj4gKyNkZWZpbmUgICAgICAgICAgICAgICAgUklTQ1ZfSFdQUk9CRV9F
WFRfWklDQ0xTTSAgICAgICAoMVVMTCA8PCAxKQo+Cj4gIC8qIEluY3JlYXNlIFJJU0NWX0hXUFJP
QkVfTUFYX0tFWSB3aGVuIGFkZGluZyBpdGVtcy4gKi8KPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMK
PiBpbmRleCA2ODZkZGUzY2UzYjk4Li4xZmI1OTU1ODFhZGNmIDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZl
YXR1cmUuYwo+IEBAIC01MDIsNiArNTAyLDcgQEAgY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRf
ZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7Cj4gICAgICAgICBfX1JJU0NWX0lTQV9FWFRfU1VQRVJT
RVRfVkFMSURBVEUoemljYm9tLCBSSVNDVl9JU0FfRVhUX1pJQ0JPTSwgcmlzY3ZfeGxpbnV4ZW52
Y2ZnX2V4dHMsIHJpc2N2X2V4dF96aWNib21fdmFsaWRhdGUpLAo+ICAgICAgICAgX19SSVNDVl9J
U0FfRVhUX0RBVEFfVkFMSURBVEUoemljYm9wLCBSSVNDVl9JU0FfRVhUX1pJQ0JPUCwgcmlzY3Zf
ZXh0X3ppY2JvcF92YWxpZGF0ZSksCj4gICAgICAgICBfX1JJU0NWX0lTQV9FWFRfU1VQRVJTRVRf
VkFMSURBVEUoemljYm96LCBSSVNDVl9JU0FfRVhUX1pJQ0JPWiwgcmlzY3ZfeGxpbnV4ZW52Y2Zn
X2V4dHMsIHJpc2N2X2V4dF96aWNib3pfdmFsaWRhdGUpLAo+ICsgICAgICAgX19SSVNDVl9JU0Ff
RVhUX0RBVEEoemljY2xzbSwgUklTQ1ZfSVNBX0VYVF9aSUNDTFNNKSwKPiAgICAgICAgIF9fUklT
Q1ZfSVNBX0VYVF9EQVRBKHppY2Nyc2UsIFJJU0NWX0lTQV9FWFRfWklDQ1JTRSksCj4gICAgICAg
ICBfX1JJU0NWX0lTQV9FWFRfU1VQRVJTRVRfVkFMSURBVEUoemljZmlscCwgUklTQ1ZfSVNBX0VY
VF9aSUNGSUxQLCByaXNjdl94bGludXhlbnZjZmdfZXh0cywKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICByaXNjdl9jZmlscF92YWxpZGF0ZSksCj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9z
eXNfaHdwcm9iZS5jCj4gaW5kZXggZjhmNjhiYTc4MWI0NS4uOWNmNjIyNjZmMTg5MCAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCj4gKysrIGIvYXJjaC9yaXNj
di9rZXJuZWwvc3lzX2h3cHJvYmUuYwo+IEBAIC0yMDUsNiArMjA1LDcgQEAgc3RhdGljIHZvaWQg
aHdwcm9iZV9pc2FfZXh0MShzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKPiAgICAgICAgICAg
ICAgICAgICogaW4gdGhlIGhhcnRfaXNhIGJpdG1hcCwgYXJlIG1hZGUuCj4gICAgICAgICAgICAg
ICAgICAqLwo+ICAgICAgICAgICAgICAgICBFWFRfS0VZKGlzYWluZm8tPmlzYSwgWklDRklTUywg
cGFpci0+dmFsdWUsIG1pc3NpbmcpOwo+ICsgICAgICAgICAgICAgICBFWFRfS0VZKGlzYWluZm8t
PmlzYSwgWklDQ0xTTSwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwo+ICAgICAgICAgfQo+Cj4gICAg
ICAgICAvKiBOb3cgdHVybiBvZmYgcmVwb3J0aW5nIGZlYXR1cmVzIGlmIGFueSBDUFUgaXMgbWlz
c2luZyBpdC4gKi8KPgo+IC0tCj4gMi40My4wCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPgoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBs
aXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
