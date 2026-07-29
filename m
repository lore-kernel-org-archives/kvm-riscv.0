Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E1DC53219
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 16:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0arte9P3EfEZqev+5XcsBR00lBzIGLmXjMso0BgpiPs=; b=CYRG73i+5lOSIV
	sBJ5FjGD1kV7ioF6PMvcC2q84DHBJMmhT9PXs+kLXvhf++hGLE9VqlOR+VG6uD/2Nnh4xC5+ZcZm+
	2nZQhkuqAhyjhgbjYEVDRE/epYem1KyjIfc17cm1d0W1riNkNpHzUELjgcmWakajJzhjbzgOO/iaj
	uLuKu3KsDC7Ix3p97qB1ecQ2Eonv5i2/0YzVNtvpr/9YHWlPecZQ27bjcdL2XDRba/TM+CH6nEGMf
	XHqyO6aeGUtiEpQ0OqbtInUjn5C/Dmi0lkO8s5D3fcRLIoj4oxoyCcp429bCHrM7Uf6JL2V9fTLxC
	Pqb/Fz6JkteYhOtI1GmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6qd-00000008Vg6-39jW;
	Wed, 29 Jul 2026 16:09:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6qc-00000008Vey-0UJD
	for kvm-riscv@bombadil.infradead.org;
	Wed, 29 Jul 2026 16:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3zuC/oQvIKv9ZO7b1iXct9muPojkdOiWtkgZr7atSyM=; b=Q8kiRZFrBBoqKh0+oK5FFLMONP
	qpq/hA8HczJLmY/j1ibjNJYcbotC6mPDtRgFtZrUNXKy6jVKlf2NsR1YEaRuz+ZQS/kfNC7uo126w
	LOQ6Iaw+li+p1ZtyWFiI+t+okL4+xOW+qruMlxm2ELvR4aMyee7aVzo+U8tKq8CBBHA3jAEotPMB4
	/kagUbYI43oYfnswTX62JORZ4ocy1qbj6jbk+FH+jdzlUoq/06NCM78l95o26+J9MrzEaMped0KLX
	0W3cQZNa9XkDL3AIez4Tjt159bVSrBKV2JL3pe/pixbnlKqABBAWYiSLNMBdw+x5wVeSwEpyf3T9W
	6f3Mrn/g==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wp6qX-00000005zU4-466p
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 16:09:32 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso829679f8f.0
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 09:09:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785341368; cv=none;
        d=google.com; s=arc-20260327;
        b=jes+X1UBmKSn5C5om0E9cAgbaYF9tawiobi3UaI+FpLkiFDQGuNTjT6e5XAzvH1jfk
         0yDYmpSpGa8PsnbPqMzj7ZNehXiGeavA9XWhG5Z0+GcLAGw/9MgO6V7046oxicAkLEkV
         WClk0t8+qrqi48H3hGa+rfpI9vuYizE6M0o+MFDZ3opQvyzw8Lw9YGyvWrdeREVeZNuT
         Hk0YNkHoDADGSxYPXSPZa9K6wpEm8xYRKDE93h0hCRowK0mxHn0jLdswK/2UD+Iy7nyR
         dgPf/PdlgYw5ikEjIFASgJP3t4Qz4wjrASR/ShDpxeL1PWZ3gf3mz3B9kdfamike7l9X
         O2cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3zuC/oQvIKv9ZO7b1iXct9muPojkdOiWtkgZr7atSyM=;
        fh=kFd0Bojn0TPE3KUhpCSlJRuT055xGXGoJ3u2A0gyLgY=;
        b=rL987pWKmkiIhT82DM+nMGzFR0uIaYjHssGcm89auNaTmBFe1lepli4qtAevK660ud
         wnqnAsmXuEOm88DTrr3fkjDBMJa6Dc1IUmQMnWDKuC9JzuDJIkGGVr9890NsXorFTQHc
         FlOMxfp0DuiLMism5Fdr4UWqEugO/RLIBTQCunPtvtyky7DlERN6Lfr306SsP8/k8vPj
         QX2Q1IBgDmw5YnruTIfKi49Q2VWRiwOucq6U+s/zqPLh0D+hIbveUg1S3Kbt3Y8rCCrW
         hK0cQpa8xI3RXsQJYIatxsf8PVX/UMY5GfffgWSENMHAN3cc/hKB72n1edvLs00/hKHd
         eHnQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785341368; x=1785946168; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3zuC/oQvIKv9ZO7b1iXct9muPojkdOiWtkgZr7atSyM=;
        b=esKqA4H3vi38ve5xWUWNaGxy6gdsPykLkSEbTC/Og/wfXgo11aSNvpRDIleCjvfzTr
         ZxNPn9Nmigx7Jb1bU/XCgqnC/+syxIA7RckkfjHPk9I2mRMcH2ILcmngplOIOzpvR3PO
         +hkzxDHHIG5yEQHqXXcHQNS8FrPhKhe0+4HNsjeR8qMrScoT1BaWNLRE6ArzMqcsMpYu
         V00DrJsyrbdLoNGwPJU2JJBkhc8MJW+Kc/A+peFXwVcOVmCcGjZ8IwN60Bxl191uTUGp
         FqhBfrR+yluEinyMNhZX2FRzgrtSJh57lQ6ENmuVGd8t1QKCPMhNpnANrall6xr8TW7F
         t92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785341368; x=1785946168;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3zuC/oQvIKv9ZO7b1iXct9muPojkdOiWtkgZr7atSyM=;
        b=N8JxrPp1CpwEYi2oiPqVL2qdl1G6XH3qdksN4SC6J8AG1Q92QI9N4m8VVzTrUh0dm7
         72JOp/NBVWUHcS8Glxf+VCc80EIXDC4ut49B+Ap5aydvKQSUVQBUwZxcn1BZkjYCqXmF
         DR6hKFRo5YyL+sAN2WLjTbGUiE8JDdJh3/xkwSSepCMFiSTaMRgVP9InkNNTjDjhckOk
         CYQc5KVQICPEOI4hHY/P/sbfv9TnOE/EFx6UeZaaJh1XtDtcHaQZ61Hn77KKPzr9INjT
         lltbNFjNCozmqxaePWB9QUrFt0vgGKVlYEXn5XmgLIxxjppI/3/+4NJQq7iMBkgmPA4O
         G0CQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnAHjn9mu9QgPR5fwgB11sGQ5R1EZaYXFxv81TGCxHZkrdo31WpJFDgsB12LrNWwUMk7s+V+t8Vb4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyzEVwKi4EQk9hlJsc4AA5Ei8poKc91CuhtozdoGe8ZDzG8Bdzi
	Yp+3zfNAb+Okk6XEkDwPa32nKbJTF8SQLNqLHHdxPQv12zrGvxvjHio9sMm2xI0qFjAMTetgwhd
	0GDFywyDl4UO+24N9Zvz0XeHaA2k16ZUoxZF4xaT2ow==
X-Gm-Gg: AR+sD13VJ+YITmOUKAi2ni0GIuz3+PCJ/P9rFOaAnSG6RMh+/DUwAuQhNXBiNwkohH7
	M3eRNv+LzLZWwDNWcwBZNvEOFfhZWWVXrYB5MK5J3CeJ1eBL1V4IopDh7OXIKxKmz+fAELTueMJ
	ionPH3xM5iN9bD7dLAoKNk9Yt+bp+pz+XsvxqS3IAsJrLR+s4az93Qb4iu7gYrk+ckZthD9Bsg/
	taZM5oHdLtQnDTlrycv9p1BP2RW8Kn1TiKI+uImDWgEEqmwjes2NsmWIHB0FMj6JETBSKd9HrCE
	2+txO0Y4Y75oTBj01/sY5yMGZlxybfgOdtonk6/8B6s1bVH3taxZFEVask2nGO3IzhTEt2DoUU5
	Z0dPR5VKkSRE5LqZs9Th+nXIE8O5hTkxjb3Jf4xNC3dcsjAYgmHesvo8dJdkZhgI3
X-Received: by 2002:a05:6000:230c:b0:475:f100:3607 with SMTP id
 ffacd0b85a97d-47fb1ee72ccmr9567614f8f.54.1785341367986; Wed, 29 Jul 2026
 09:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260729075230.743030-1-shanbeeyoo@gmail.com> <20260729120733.829457-1-shanbeeyoo@gmail.com>
 <20260729120733.829457-3-shanbeeyoo@gmail.com>
In-Reply-To: <20260729120733.829457-3-shanbeeyoo@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 21:39:16 +0530
X-Gm-Features: AUfX_my5C6bC1gg8YQo_QEqDM5Cr5_eRkLpJTSlYIaDahaeJGjleoyTTh0Bt330
Message-ID: <CAAhSdy0Bn3N+weuszLa3VX6rJHRoXRSwqEf3MZEoSJXy6=cwxw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] RISC-V: KVM: Use unsigned int for vma_pageshift
To: "Bingyu.Xian" <shanbeeyoo@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Quan Zhou <zhouquan@iscas.ac.cn>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_170930_093772_CB4266DE 
X-CRM114-Status: GOOD (  13.84  )
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

T24gV2VkLCBKdWwgMjksIDIwMjYgYXQgNTozN+KAr1BNIEJpbmd5dS5YaWFuIDxzaGFuYmVleW9v
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiB2bWFfcGFnZXNoaWZ0IGluIGt2bV9yaXNjdl9tbXVfbWFw
KCkgd2FzIGRlY2xhcmVkIHNob3J0LiAgVXNlIHVuc2lnbmVkCj4gaW50LCB0aGUgY29udmVudGlv
bmFsIGtlcm5lbCB0eXBlIGZvciBiaXQgd2lkdGhzIGFuZCBzaGlmdCBjb3VudHMsIGluCj4gcHJl
cGFyYXRpb24gZm9yIHNoYXJpbmcgYSBjb21tb24gc3RydWN0IGt2bV9wYWdlX2ZhdWx0IGFjcm9z
cwo+IGFyY2hpdGVjdHVyZXMuICBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPgo+IEFzc2lzdGVkLWJ5
OiBZdWFuU2hlbmc6IGRlZXBzZWVrLXY0LXBybwo+IENvLWRldmVsb3BlZC1ieTogUXVhbiBaaG91
IDx6aG91cXVhbkBpc2Nhcy5hYy5jbj4KPiBTaWduZWQtb2ZmLWJ5OiBRdWFuIFpob3UgPHpob3Vx
dWFuQGlzY2FzLmFjLmNuPgo+IFNpZ25lZC1vZmYtYnk6IEJpbmd5dSBYaWFuIDxzaGFuYmVleW9v
QGdtYWlsLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZh
dWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC03LjMKClRoYW5rcywKQW51cAoK
PiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vbW11LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a3ZtL21tdS5jIGIvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiBpbmRleCA5NDNkOGRjNzIxMDUuLmQy
YTA2YTU0YmUxNyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+ICsrKyBiL2Fy
Y2gvcmlzY3Yva3ZtL21tdS5jCj4gQEAgLTU0MSw3ICs1NDEsNyBAQCBpbnQga3ZtX3Jpc2N2X21t
dV9tYXAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICptZW1z
bG90LAo+ICAgICAgICAga3ZtX3Bmbl90IGhmbjsKPiAgICAgICAgIGJvb2wgaXNfaHVnZXRsYjsK
PiAgICAgICAgIGJvb2wgd3JpdGFibGU7Cj4gLSAgICAgICBzaG9ydCB2bWFfcGFnZXNoaWZ0Owo+
ICsgICAgICAgdW5zaWduZWQgaW50IHZtYV9wYWdlc2hpZnQ7Cj4gICAgICAgICBnZm5fdCBnZm4g
PSBncGEgPj4gUEFHRV9TSElGVDsKPiAgICAgICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1h
Owo+ICAgICAgICAgc3RydWN0IGt2bSAqa3ZtID0gdmNwdS0+a3ZtOwo+IC0tCj4gMi41NC4wCj4K
Ci0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
