Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEB8CAC592
	for <kvm-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 03:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NbEtVfJzTH3zyPK4cWrLUC200IXQgxtcbPtgyFqUPVs=; b=nEjxDt+MaLcANj
	wXAjMb3NZqcap0e9unXECAqjiAHzgdLl4dD5nGTGsKBWOA/LMYGhvpopbqE+dkM+5nIaEqorkCCog
	9gEzJfGuim2TaTxlHck4kHmQEZYeFG/Ivu3JmURsfjdb3b6UevLo/HmGesU/RBL/1Or7uXViO+NIR
	GrcnJRlp0e/KcE1SFvJAD2MhSEfpYKu0wDfAyBBQ+0nd97wINOMfrluR7epxjdzCkIS/Usa+iXsAn
	vOdU+XMX8Rgt3A79XrHYCY7FTun5XqSO0tXXmg293KO0qBdcaw7qNQgUSDheQHQqHID3g4MeOrAgh
	AMc4vX3odcnYeF8r0eHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0XWz-00000008iyQ-0H2T;
	Mon, 22 Sep 2025 03:48:01 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0XWv-00000008ixO-25qG
	for kvm-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 03:47:59 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-4256ef4eeebso12088725ab.2
        for <kvm-riscv@lists.infradead.org>; Sun, 21 Sep 2025 20:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1758512876; x=1759117676; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGuVEvHGyfQ2BFC63znl+bSOQQ/TN+svZB+fJgEKx9M=;
        b=FtIIr0bVGEzyswlMxZDc8uCh+fGzgJlR1G69sw4r6u17e26OQanTc/2J+xS+LBH0Ve
         3uLvrwZKpYAMsByAl0N+SxXPx8ExR6u3OSeVeT6EHGbllZx3Qqk+EGpO8HbuOmQwUAKz
         BO64ddZhwG+R7jH0OHuOtQrwn4+/lpvTqRtU2s7njZtVDpES87RJHumov8xhxAQ+QtXR
         ilhsDn2F1DdW5UQ/WBYqKKCy+JFzhCTROdoqKb0Qvb/ICrJVIRPIIrDqWEjakOWBiBm5
         eGiX7/kRAjQcR22mUitM6+H7VRlPyTOz5V+QSaDdaINwgy9YfgfqgQdKj2nzyNLF+q+q
         D6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758512876; x=1759117676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xGuVEvHGyfQ2BFC63znl+bSOQQ/TN+svZB+fJgEKx9M=;
        b=Xd9KhYVH46SaBeY9reGYxaKSQKjU56+2qbpZaGQm7BixMmkgNGJXMYv5mxfEybTESs
         jJ79RKWOYoC05ONcM6+sSgnY18LOgLMfac5A7fxAuQIvGvBIhbtvmLoa4BdzQc3OzzRt
         lZuytUak3BnNf+qWZTtmgxMsvBYh/4NQFsXHBlmHZuVB4JgSFVARVA04o6AoBWRi9cEt
         jKiZZ6XJYozgH1F7BQlWg3lO93dj1zeT7YiUu7/hgoN94iBOksCL1LdOUgWH8BHL5iFB
         Ndn0E6jQI3we/euDR/qrWm8Y+BwHa5f7BUKRUkZy8ovJvZNTMXM7BlY4HiNTT/1K8sC4
         4Iyw==
X-Forwarded-Encrypted: i=1; AJvYcCXlybSX5RAG7MuSULeep+ZLNzGi36qki4ESZiFRfWI8e6DEn79iDRHbV/wxhzEjIdiRygOZBGnWRbY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8cP5m3yvpns/T99dPMWF8gElOyaLfW6FlzEQt/3ouO7Pl+VR9
	zWS+L39G568zhAxm4SgiaZcwiQwwkQv/VqFjEbW+Z9EnVEfMz/bkvSEAW5r+B240ytyqnkiLRRh
	oACWgjqbVoHQQ+AA8BdXx5JQG1L/QLRzyoQOQlv/Ehg==
X-Gm-Gg: ASbGncu9reZdRnVTyZs/TThNMhELq3LNBUVIDAv8Nd32l0W+c5SIvILDgLU4mcPqZCM
	7F3jNv8p+c/BOtdtQr+E6+SDb0X4lIFz+FsQeJmwQLUb6r3Beu1ZxZzYtF5NJP6A4XPYxQBiDMr
	CnMxkKGo9Aub+2eg0hfNZAUXxdA44L+DQdRJbkjECNL2ecn7SYyaEXGCITnP1iH73/NtToeLzmv
	4F1A594ES7fFP8GTgazARNtkkwD782d87yWOOb/
X-Google-Smtp-Source: AGHT+IHO8DNLPyWRRVhnXNw51Hz0e4MEtudltvnf2lQqnZc/nn0n4GS3gLJxQNB6R7/XqLb0csBtp5kh4GKuFoaudA8=
X-Received: by 2002:a05:6e02:18ce:b0:424:7de2:61ca with SMTP id
 e9e14a558f8ab-4248199c624mr163717175ab.20.1758512876440; Sun, 21 Sep 2025
 20:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250714072051.1928-1-xiangwencheng@lanxincomputing.com>
In-Reply-To: <20250714072051.1928-1-xiangwencheng@lanxincomputing.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 22 Sep 2025 09:17:45 +0530
X-Gm-Features: AS18NWCodXxq_NwRnNatjdWFDrBUIO_QWr6YpBDyOo-YuWb6ERuQ-Hm3OHSaNi8
Message-ID: <CAAhSdy1WaaSSdPqHQfNGdc98vfvF83YZYetd4jVPpHWQJEY5GQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Introduce KVM_EXIT_FAIL_ENTRY_NO_VSFILE
To: BillXiang <xiangwencheng@lanxincomputing.com>
Cc: atish.patra@linux.dev, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_204757_554312_C1F3B81E 
X-CRM114-Status: GOOD (  20.92  )
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

T24gTW9uLCBKdWwgMTQsIDIwMjUgYXQgMTI6NTHigK9QTSBCaWxsWGlhbmcKPHhpYW5nd2VuY2hl
bmdAbGFueGluY29tcHV0aW5nLmNvbT4gd3JvdGU6Cj4KPiBDb25zaWRlciBhIHN5c3RlbSB3aXRo
IDggaGFydHMsIHdoZXJlIGVhY2ggaGFydCBzdXBwb3J0cyA1Cj4gR3Vlc3QgSW50ZXJydXB0IEZp
bGVzIChHSUZzKSwgeWllbGRpbmcgNDAgdG90YWwgR0lGcy4KPiBJZiB3ZSBsYXVuY2ggYSBRRU1V
IGd1ZXN0IHdpdGggb3ZlciA1IHZDUFVzIHVzaW5nCj4gIi1NIHZpcnQsYWlhPSdhcGxpYy1pbXNp
YycgLWFjY2VsIGt2bSxyaXNjdi1haWE9aHdhY2NlbCIg4oCTIHdoaWNoCj4gcmVsaWVzIHNvbGVs
eSBvbiBWUy1maWxlcyAobm90IFNXLWZpbGVzKSBmb3IgaGlnaGVyIHBlcmZvcm1hbmNlIOKAkyB0
aGUKPiBndWVzdCByZXF1aXJlcyBtb3JlIHRoYW4gNSBHSUZzLiBIb3dldmVyLCB0aGUgY3VycmVu
dCBMaW51eCBzY2hlZHVsZXIKPiBsYWNrcyBHSUYgYXdhcmVuZXNzLCBwb3RlbnRpYWxseSBzY2hl
ZHVsaW5nID41IHZDUFVzIHRvIGEgc2luZ2xlIGhhcnQuCj4gVGhpcyB0cmlnZ2VycyBWUy1maWxl
IGFsbG9jYXRpb24gZmFpbHVyZSwgYW5kIHNpbmNlIG5vIGhhbmRsZXIgZXhpc3RzCj4gZm9yIHRo
aXMgZXJyb3IsIHRoZSBRRU1VIGd1ZXN0IGJlY29tZXMgY29ycnVwdGVkLgo+Cj4gVG8gYWRkcmVz
cyB0aGlzLCB3ZSBpbnRyb2R1Y2UgS1ZNX0VYSVRfRkFJTF9FTlRSWV9OT19WU0ZJTEUgdXBvbgo+
IFZTLWZpbGUgYWxsb2NhdGlvbiBmYWlsdXJlLiBUaGlzIHByb3ZpZGVzIGFuIG9wcG9ydHVuaXR5
IGZvciBncmFjZWZ1bAo+IGVycm9yIGhhbmRsaW5nIGluc3RlYWQgb2YgY29ycnVwdGlvbi4gRm9y
IGV4YW1wbGUsIFFFTVUgY2FuIGhhbmRsZQo+IHRoaXMgZXhpdCBieSByZXNjaGVkdWxpbmcgdkNQ
VXMgdG8gYWx0ZXJuYXRpdmUgaGFydHMgd2hlbiBWUy1maWxlCj4gYWxsb2NhdGlvbiBmYWlscyBv
biB0aGUgY3VycmVudCBoYXJ0IFsxXS4KCkN1cnJlbnRseSwgd2UgcmV0dXJuIENTUl9IU1RBVFVT
IGFzIGhhcmR3YXJlX2VudHJ5X2ZhaWx1cmVfcmVhc29uCndoaWNoIGlzIHZhZ3VlIHNvIGl0IGlz
IGJldHRlciB0byByZXR1cm4gYSB3ZWxsIGRlZmluZWQgdmFsdWUgcHJvdmlkZWQgdmlhCnVhcGkv
YXNtL2t2bS5oLiBJbiBnZW5lcmFsLCB0aGlzIHBhdGNoIGlzIGZpbmUgYnV0IHRoZSBjb21taXQg
ZGVzY3JpcHRpb24KbmVlZHMgdG8gYmUgaW1wcm92ZWQgYWxvbmcgdGhlc2UgbGluZXMuCgpSZWdh
cmRzLApBbnVwCgo+Cj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9CaWxsWGlhbmcvcWVtdS90cmVl
L3Jpc2N2LXZzZmlsZS1hbGxvYy8KPgo+IFNpZ25lZC1vZmYtYnk6IEJpbGxYaWFuZyA8eGlhbmd3
ZW5jaGVuZ0BsYW54aW5jb21wdXRpbmcuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUv
dWFwaS9hc20va3ZtLmggfCAyICsrCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jICAgICAg
ICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiBpbmRleCA1ZjU5ZmQyMjZjYzUuLmJl
MjljMzUwMmZlNCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3Zt
LmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiBAQCAtMjIsNiAr
MjIsOCBAQAo+ICAjZGVmaW5lIEtWTV9JTlRFUlJVUFRfU0VUICAgICAgLTFVCj4gICNkZWZpbmUg
S1ZNX0lOVEVSUlVQVF9VTlNFVCAgICAtMlUKPgo+ICsjZGVmaW5lIEtWTV9FWElUX0ZBSUxfRU5U
UllfTk9fVlNGSUxFICAoMVVMTCA8PCAwKQo+ICsKPiAgLyogZm9yIEtWTV9HRVRfUkVHUyBhbmQg
S1ZNX1NFVF9SRUdTICovCj4gIHN0cnVjdCBrdm1fcmVncyB7Cj4gIH07Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jIGIvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMK
PiBpbmRleCAyOWVmOWMyMTMzYTkuLjY5YjBhYjY1MTM4OSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2t2bS9haWFfaW1zaWMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4g
QEAgLTc2MCw3ICs3NjAsNyBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX3VwZGF0ZShz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gICAgICAgICAgICAgICAgIC8qIEZvciBIVyBhY2NlbGVy
YXRpb24gbW9kZSwgd2UgY2FuJ3QgY29udGludWUgKi8KPiAgICAgICAgICAgICAgICAgaWYgKGt2
bS0+YXJjaC5haWEubW9kZSA9PSBLVk1fREVWX1JJU0NWX0FJQV9NT0RFX0hXQUNDRUwpIHsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICBydW4tPmZhaWxfZW50cnkuaGFyZHdhcmVfZW50cnlfZmFp
bHVyZV9yZWFzb24gPQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBDU1JfSFNUQVRVUzsKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgS1ZNX0VYSVRfRkFJ
TF9FTlRSWV9OT19WU0ZJTEU7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcnVuLT5mYWlsX2Vu
dHJ5LmNwdSA9IHZjcHUtPmNwdTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBydW4tPmV4aXRf
cmVhc29uID0gS1ZNX0VYSVRfRkFJTF9FTlRSWTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gMDsKPiAtLQo+IDIuNDYuMi53aW5kb3dzLjEKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBs
aXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
