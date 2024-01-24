From: Thomas Huth <thuth@redhat.com>
Date: Wed, 24 Jan 2024 10:41:05 +0100
Subject: [kvm-unit-tests PATCH 21/24] lib: Add strcasecmp and strncasecmp
In-Reply-To: <20240124071815.6898-47-andrew.jones@linux.dev>
References: <20240124071815.6898-26-andrew.jones@linux.dev>
 <20240124071815.6898-47-andrew.jones@linux.dev>
Message-ID: <44e2bf47-9948-42d6-aa6a-6a24e29d7ee1@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 24/01/2024 08.18, Andrew Jones wrote:
> We'll soon want a case insensitive string comparison. Add toupper()
> and tolower() too (the latter gets used by the new string functions).
> 
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>   lib/ctype.h  | 10 ++++++++++
>   lib/string.c | 14 ++++++++++++++
>   lib/string.h |  2 ++
>   3 files changed, 26 insertions(+)

Reviewed-by: Thomas Huth <thuth@redhat.com>



