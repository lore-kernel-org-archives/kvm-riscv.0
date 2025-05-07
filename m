Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC03C369DC
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 May 2025 06:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CWVquD1lmehbw99TAeWDdfEK8Mrx90CDdLIw1MizC8M=; b=lxuOhK8nT/Fr8u
	lNsD+3IHxqEx1IgPS0K9ePZlYROgVwqT6sXG4n9UXAQCaNAVWUS7D9wsJ+Ue8VsY4Ek9fdM6Juqma
	cY6h0Vt/Z19jU5oPRSMiEsvHjTKf2XZQwiV+ZKQ7SHiAfFcgoelw79P/k5NtgxCpgM9BodWDRqkdR
	TT0iq/MMpCycLDnGYiu35b2BjZY+Th8tShzMw+9T1+B00KZEcXe0QJk6Vb9HZj+SlcB3xuuZePnWl
	ofqKBlDo8GdS7KjlhveMrcGRlbhviTd8nDRMjnsPvbo4ZocedsVevFkSuRJeTAB0Yg4/X7BUTUSaq
	3gcYf2OqTiTtKmyQJmgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCYRY-0000000EOag-2nzn;
	Wed, 07 May 2025 06:39:48 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCYQL-0000000EOJA-2JHB
	for kvm-riscv@lists.infradead.org;
	Wed, 07 May 2025 06:38:34 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3d57143ee39so58920515ab.1
        for <kvm-riscv@lists.infradead.org>; Tue, 06 May 2025 23:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1746599913; x=1747204713; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLSCTSvU1Pu3KZzXKgSBgnw1+cmm1sdq2UzaECQAViA=;
        b=sWiIx0p0zq5xPPZGzDa9Abdr7qv7GeOE5ovxyd5GMG5b24hUxlFGIkwaWl5AHbFPdQ
         lVU31P+Jj7mjsuMVhXuXtciXzRRqRrecM08x2VHpDJc5eRbEJEVc/PM7cbc+2Hr0OSIw
         1xoDEuzoqQl6N83iuUtSR0rOERZovJpCJCtYG19kaLp7MgUNjB3dHgMqk4bLmrtSlBzK
         itQOKnEVVTGHL0AdMXdPkaA0aAAVFfxG2X6qtZHxV1rqDeiL2kNyvU7mk3Qe1VmGgH2+
         hRvmAZNrlmccQJEkd33T6PsMa+cbEJtiuB8OUozLjZDYsCT6e2UxmzqkiVchPMRbWgkS
         f74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746599913; x=1747204713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SLSCTSvU1Pu3KZzXKgSBgnw1+cmm1sdq2UzaECQAViA=;
        b=Nb/nlJ2ooGbQvmjyfeGU2VyeauWG/s46Ki5wOoE8NyBeBcl4CFoFATUiPtVg5IVyc+
         DE3mRjtuxfN15xUuLOVjZs4J3WWv1uSzrlmm0cuo70JA9KbYWjKQp1737FxkDjN66tCe
         u0lt/Eti0z54SHH1tXvTzYrjKUPfnSoZo3+zhv0EucUY0SykHXOudUFmqwaG1YKt+gdi
         fHMPEn52QOcPh4J+CpYlIgpnpg44Zh7KPORMVQAccixr/EHTocaC3j6DEm9dTq7TMNkY
         doj33SNtpFf8o2mK4A0KNelxf+a4Lrhczduut9tN5U3/vBJ3gDuZ436uUm8/G6X4RFml
         81MA==
X-Forwarded-Encrypted: i=1; AJvYcCXPBijnk4I+gYEVB5e2Tcavpswp8begd6XECLUZT7Nn+kTsBr7vuUfe0C1UWEdLxylcawUj9ySWThY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZEMePD13GSM3CpVVFdaGkgyQgbArGhjCouKYg/+23qxRStXeb
	T2W+IlRAf1rYrAjb0wtPKuTuOUtHSAymCAX3ul+xnj6Tregwwj314mo2B8ba74vAj5e63DtZKzW
	3sDugAyz7TP2MWEmNLh3g5dKKYqrQYRCQpr9JvA==
X-Gm-Gg: ASbGncu9989Thic4DLu+VgAkrFZCN/amAebWGfV0LgXptMrwHcXYX0dm6ET8qNfV2ML
	/Q5XTqVgFM1aptiIKOFM1R2JPHcTrXoLXn5irkmsp5ghL8CLgar/LJ4elj35wskW6vreiH2BEUb
	uPilG2gcQPs6JsIWmgCZwo
X-Google-Smtp-Source: AGHT+IHf27rispqj66mqizfYO/3jAKoO4k+nD2tMDDWQ6j9J0hfCfqo5ejjOrQE39XLxzrAH6W+8xBqOHYZ/XCR2Qq0=
X-Received: by 2002:a05:6e02:3d83:b0:3d9:2ca8:dda0 with SMTP id
 e9e14a558f8ab-3da7393603amr23647845ab.22.1746599912818; Tue, 06 May 2025
 23:38:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250505-kvm_tag_change-v1-1-6dbf6af240af@rivosinc.com>
In-Reply-To: <20250505-kvm_tag_change-v1-1-6dbf6af240af@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 7 May 2025 12:08:22 +0530
X-Gm-Features: ATxdqUEEO9ElPqopLSdn1cGhHTcD6oP-eNKU_g5Vu-IabLPJnfhIVALu0OXu3ns
Message-ID: <CAAhSdy0pdqnUa-GWiGHG3H_J9=J2yGXcRLfzsZgDzaZv+6r=jQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Remove experimental tag for RISC-V
To: Atish Patra <atishp@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_233833_590386_AAF4163F 
X-CRM114-Status: GOOD (  13.37  )
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

T24gVHVlLCBNYXkgNiwgMjAyNSBhdCAxOjE34oCvQU0gQXRpc2ggUGF0cmEgPGF0aXNocEByaXZv
c2luYy5jb20+IHdyb3RlOgo+Cj4gUklTQy1WIEtWTSBwb3J0IGlzIG5vIGxvbmdlciBleHBlcmlt
ZW50YWwuIExldCdzIHJlbW92ZSBpdCB0byBhdm9pZAo+IGNvbmZ1c2lvbi4KPgo+IFNpZ25lZC1v
ZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgo+IC0tLQo+ICBhcmNoL3Jp
c2N2L2t2bS9LY29uZmlnIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKClF1ZXVlZCBmb3IgTGludXgtNi4xNgoKVGhhbmtzLApBbnVwCgo+Cj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL0tjb25maWcgYi9hcmNoL3Jpc2N2L2t2bS9LY29u
ZmlnCj4gaW5kZXggMGMzY2JiMDkxNWZmLi43MDRjMjg5OTE5N2UgMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9yaXNjdi9rdm0vS2NvbmZpZwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL0tjb25maWcKPiBAQCAt
MTgsNyArMTgsNyBAQCBtZW51Y29uZmlnIFZJUlRVQUxJWkFUSU9OCj4gIGlmIFZJUlRVQUxJWkFU
SU9OCj4KPiAgY29uZmlnIEtWTQo+IC0gICAgICAgdHJpc3RhdGUgIktlcm5lbC1iYXNlZCBWaXJ0
dWFsIE1hY2hpbmUgKEtWTSkgc3VwcG9ydCAoRVhQRVJJTUVOVEFMKSIKPiArICAgICAgIHRyaXN0
YXRlICJLZXJuZWwtYmFzZWQgVmlydHVhbCBNYWNoaW5lIChLVk0pIHN1cHBvcnQiCj4gICAgICAg
ICBkZXBlbmRzIG9uIFJJU0NWX1NCSSAmJiBNTVUKPiAgICAgICAgIHNlbGVjdCBIQVZFX0tWTV9J
UlFDSElQCj4gICAgICAgICBzZWxlY3QgSEFWRV9LVk1fSVJRX1JPVVRJTkcKPgo+IC0tLQo+IGJh
c2UtY29tbWl0OiBmMTVkOTdkZjVhZmFlMTZmNDBlY2VmOTQyMDMxMjM1ZDFjNmJhMTRmCj4gY2hh
bmdlLWlkOiAyMDI1MDUwNS1rdm1fdGFnX2NoYW5nZS1kZWEyNDM1MWEzNTUKPiAtLQo+IFJlZ2Fy
ZHMsCj4gQXRpc2ggcGF0cmEKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9rdm0tcmlzY3YK
